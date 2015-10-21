//
//  ActionSheetVC.swift
//  MGActionSheet
//
//  Created by atharva 2 on 13/10/15.
//  Copyright © 2015 MG. All rights reserved.
//

import UIKit

class ActionSheetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UIButton
    @IBAction func btnExample1(sender: AnyObject) {
        self.actionSheetExample1()
    }
    
    @IBAction func btnExample2(sender: AnyObject) {
        self.actionSheetExample2()
    }
    
    //MARK: Actionsheet
    func actionSheetExample1() -> Void {
        
        let settingsActionSheet: UIAlertController = UIAlertController(title:nil, message:nil, preferredStyle:UIAlertControllerStyle.ActionSheet)        
        let cameraAA = UIAlertAction(title: "Camera", style: .Default, handler: { (action) -> Void in
            print("Camera")
        })
        let albumAA = UIAlertAction(title: "Album", style: .Default, handler: { (action) -> Void in
            print("Album")
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
    
    func actionSheetExample2() -> Void {
        
        // insert UIAlertController with LoginForm code here..
        var txtUserName: UITextField?
        var txtPassword: UITextField?
        
        let alertController = UIAlertController(title: "UIAlertController", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        let okAA = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
           
            print("Email : \(txtUserName?.text)")
            print("Password : \(txtPassword?.text)")
        
        })
        let cancelAA = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            print("Cancel")
        }
        
        alertController.addAction(okAA)
        alertController.addAction(cancelAA)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
           
            txtUserName = textField
            txtUserName?.placeholder = "User ID"
        
        }
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
           
            txtPassword = textField
            txtPassword?.placeholder = "Password"
            txtPassword?.secureTextEntry = true
        
        }
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
}
