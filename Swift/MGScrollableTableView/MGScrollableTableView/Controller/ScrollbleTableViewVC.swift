//
//  ScrollbleTableViewVC.swift
//  MGScrollableTableView
//
//  Created by Mitalkumar on 14/10/15.
//  Copyright © 2015 AtharvaSystem. All rights reserved.
//

import UIKit

class ScrollbleTableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrcell : NSMutableArray = []
    var arrData : NSMutableArray = []
    
    @IBOutlet weak var tableView: UITableView?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Scrollble TableView"
        self.setData()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UITableView - Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arrData.count
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderView : UIView;
        let lblTitle : UILabel;
        let font : UIFont;
        
        if(section == 0) {
            
            font = UIFont.boldSystemFontOfSize(18)
            lblTitle = UILabel(frame: CGRectMake(10, 0, tableView.frame.size.width, 40))
            sectionHeaderView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
            
        } else {
            
            font = UIFont.boldSystemFontOfSize(14)
            lblTitle = UILabel(frame: CGRectMake(10, 0, tableView.frame.size.width, 30))
            sectionHeaderView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 30))
            
        }
        
        let dict :  Dictionary<String, AnyObject> = arrData[section] as! Dictionary<String, AnyObject>
        let category : String = dict["category"] as! String

        lblTitle.textAlignment = NSTextAlignment.Left
        lblTitle.textColor = UIColorFromRGB(0x4B4D52)
        lblTitle.backgroundColor = UIColor.clearColor()
        lblTitle.font = font
        lblTitle.text = category
        
        sectionHeaderView.backgroundColor = UIColorFromRGB(0xB9B1A8)
        sectionHeaderView.addSubview(lblTitle)
        
        return sectionHeaderView;
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 192
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : ScrollbleCell = arrcell[indexPath.section] as! ScrollbleCell
        return cell
    
    }
    
    //MARK: SetData
    func setData() -> Void {

        let arrFlowers : NSMutableArray = []
        
        //Row - 1
        var dict: Dictionary<String, String> = [:]
        dict["ImageName"] = "flower1"
        dict["Description"] = "flower 1"
        arrFlowers.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "flower2"
        dict["Description"] = "flower 2"
        arrFlowers.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "flower3"
        dict["Description"] = "flower 3"
        arrFlowers.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "flower4"
        dict["Description"] = "flower 4"
        arrFlowers.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "flower5"
        dict["Description"] = "flower 5"
        arrFlowers.addObject(dict)
        
        var dictFlowers : Dictionary<String, AnyObject> = [:]
        dictFlowers["category"] = "Flower"
        dictFlowers["data"] = arrFlowers
        
        arrData.addObject(dictFlowers)
        
        //Row - 2
        let arrBuidling : NSMutableArray = []
        
        dict["ImageName"] = "Building1"
        dict["Description"] = "Building 1"
        arrBuidling.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "Building2"
        dict["Description"] = "Building 2"
        arrBuidling.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "Building3"
        dict["Description"] = "Building 3"
        arrBuidling.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "Building4"
        dict["Description"] = "Building 4"
        arrBuidling.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "Building5"
        dict["Description"] = "Building 5"
        arrBuidling.addObject(dict)
        
        var dictBuilding : Dictionary<String, AnyObject> = [:]
        dictBuilding["category"] = "Building"
        dictBuilding["data"] = arrBuidling
        
        arrData.addObject(dictBuilding)
        
        //Row - 3
        let arrTree : NSMutableArray = []
        
        dict = [:]
        dict["ImageName"] = "Tree1"
        dict["Description"] = "Tree 1"
        arrTree.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "Tree2"
        dict["Description"] = "Tree 2"
        arrTree.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "Tree3"
        dict["Description"] = "Tree 3"
        arrTree.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "Tree4"
        dict["Description"] = "Tree 4"
        arrTree.addObject(dict)
        
        var dictTree : Dictionary<String, AnyObject> = [:]
        dictTree["category"] = "Tree"
        dictTree["data"] = arrTree
        
        arrData.addObject(dictTree)
        
        //Row - 4
        let arrPeople : NSMutableArray = []
        
        dict = [:]
        dict["ImageName"] = "People1"
        dict["Description"] = "People 1"
        arrPeople.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "People2"
        dict["Description"] = "People 2"
        arrPeople.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "People3"
        dict["Title"] = "People 3"
        arrPeople.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "People4"
        dict["Description"] = "People 4"
        arrPeople.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "People5"
        dict["Description"] = "People 5"
        arrPeople.addObject(dict)
        
        var dictPeople : Dictionary<String, AnyObject> = [:]
        dictPeople["category"] = "People"
        dictPeople["data"] = arrPeople
        
        arrData.addObject(dictPeople)
        
        //Header - 5
        let arrStatue : NSMutableArray = []
        
        dict = [:]
        dict["ImageName"] = "statue1"
        dict["Description"] = "statue 1"
        arrStatue.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "statue2"
        dict["Description"] = "statue2"
        arrStatue.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "statue3"
        dict["Description"] = "statue 3"
        arrStatue.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "statue4"
        dict["Description"] = "statue 4"
        arrStatue.addObject(dict)
        
        dict = [:]
        dict["ImageName"] = "statue5"
        dict["Description"] = "statue 5"
        arrStatue.addObject(dict)
        
        var dictStatue : Dictionary<String, AnyObject> = [:]
        dictStatue["category"] = "Statue"
        dictStatue["data"] = arrStatue
        
        arrData.addObject(dictStatue)
        
        //Divide Data into Row and Coloumn
        for var index = 0; index < arrData.count; ++index {
            
            let dict: Dictionary<String, AnyObject> = arrData[index] as! Dictionary<String, AnyObject>
            
            let cell : ScrollbleCell = ScrollbleCell(frame: CGRectMake(0, 0, 320, 416))
            cell.arrCellData = dict["data"] as! NSMutableArray
            arrcell.addObject(cell)
            
        }
        
    }
    
    //MARK: Hex TO RGB
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
