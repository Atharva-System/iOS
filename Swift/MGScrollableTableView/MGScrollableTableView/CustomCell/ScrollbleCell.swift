//
//  ScrollbleCell.swift
//  MGScrollableTableView
//
//  Created by Mitalkumar on 14/10/15.
//  Copyright © 2015 AtharvaSystem. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore

class ScrollbleCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView?
    var arrCellData : NSMutableArray = []
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, 192, 192))
        self.tableView?.showsVerticalScrollIndicator = false
        self.tableView?.showsHorizontalScrollIndicator = false
        self.tableView?.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI * 0.5))
        self.tableView?.frame = CGRectMake(0, 0, 768, 192)
        self.tableView?.rowHeight = 192
        self.tableView?.backgroundColor = UIColorFromRGB(0xD0CAB7)
        self.tableView?.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        
        self.addSubview(self.tableView!)
        self.tableView!.registerNib(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")
        
        //print("ScrollbleCell - arrData : \(arrCellData)")
       
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: UITableView - Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCellData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell: DataCell = tableView.dequeueReusableCellWithIdentifier(DataCell.reuseIdentifier) as! DataCell
        let dict :  Dictionary<String, String> = arrCellData[indexPath.row] as!  Dictionary<String, String>
        cell.ivThumb?.image = UIImage(named: dict["ImageName"]!)
        cell.lblTitle?.text = dict["Description"]
        
        return cell;
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("Scrollble Cell - indexPath : \(indexPath.row) - Section : \(indexPath.section)")
        print("Scrollble Cell - Data : \(arrCellData[indexPath.row])")
        
    }
    
    //MARK: ReuseIdentifier
    class var reuseIdentifier: String {
        get {
            return "ScrollbleCell"
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
