//
//  ImageUploadVC.swift
//  MGImageUpload
//
//  Created by Mitalkumar on 23/10/15.
//  Copyright © 2015 AtharvaSystem. All rights reserved.
//

import UIKit

//For AppendString - MutableData
extension NSMutableData {
    
    func appendString(string: String) {
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        appendData(data!)
    }
}

class ImageUploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var isCamera : Bool = false;
    @IBOutlet weak var imageView: UIImageView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "ImageUpload"
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UIButton
    @IBAction func btnChooseImage(sender: AnyObject) {
        self.chooseImage()
    }
    
    //MARK: Actionsheet
    func chooseImage() -> Void {
        
        let settingsActionSheet: UIAlertController = UIAlertController(title:nil, message:nil, preferredStyle:UIAlertControllerStyle.ActionSheet)
        let cameraAA = UIAlertAction(title: "Camera", style: .Default, handler: { (action) -> Void in
            self.openCamera()
        })
        let albumAA = UIAlertAction(title: "Gallery", style: .Default, handler: { (action) -> Void in
            self.openGallery()
        })
        let cancelAA = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            print("Cancel")
        }
        
        settingsActionSheet.addAction(cameraAA)
        settingsActionSheet.addAction(albumAA)
        settingsActionSheet.addAction(cancelAA)
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            
            if let presentationController = settingsActionSheet.popoverPresentationController {
                presentationController.sourceView = self.view
                presentationController.sourceRect = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 1, 1)
                presentationController.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
            }
            
        }
        
        presentViewController(settingsActionSheet, animated: true, completion: nil)
        
    }
        
    //MARK: Image Option
    
    func openGallery() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
            isCamera = false
        
        }
        
    }
    
    func openCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
        
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
            isCamera = true
        
        } else {
            
            let alert = UIAlertController(title: "Error", message: "There is no camera available", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: {(alertAction)in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        
        }
    
    }
    
    //MARK: ImagePickerController - Delegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        imageView?.image = image
        self.dismissViewControllerAnimated(true, completion: nil);
        uploadImage(image)
    
    }
    
    //MARK: Upload Image
    func uploadImage(image:UIImage) ->Void {
    
        //Set URL
        let url = NSURL(string:"http://192.168.1.100:8888/AndroidFileUpload/fileUpload.php")
        
        //Set parameters
        let param = ["":""]
        
        //Set Boundary
        let boundary = generateBoundaryString()
        
        //Image to NSData
        let imageData = UIImageJPEGRepresentation(image, 1)
        
        //Set Rquest parameters
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        if((imageData) != nil) {
            
            request.HTTPBody = createBodyWithParameters(param, filePathKey:"image", imageDataKey: imageData!, boundary: boundary)
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                
                data, response, error in if error != nil {
                    print("error=\(error)")
                    return
                }
                
                // You can print out response object
                print("******* response = \(response)")
                    }
            
            task.resume()
            
        }
        
    }
    
    //MARK: HTTP Body Parameters
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        
        let body = NSMutableData()
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        let filename = "user-profile.jpg"
        let mimetype = "image/jpg"
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimetype)\r\n\r\n")
        body.appendData(imageDataKey)
        body.appendString("\r\n")
        
        body.appendString("--\(boundary)--\r\n")
        
        return body
    }
    
    //Set Boundary
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().UUIDString)"
    }
    
}
