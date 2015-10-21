//
//  DataCell.swift
//  MGScrollableTableView
//
//  Created by Mitalkumar on 14/10/15.
//  Copyright © 2015 AtharvaSystem. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var ivThumb: UIImageView?
    @IBOutlet weak var lblTitle: UILabel?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.backgroundColor = UIColorFromRGB(0xE3D6C6)
        self.selectedBackgroundView = UIView(frame: (self.ivThumb?.frame)!)
        self.selectedBackgroundView?.backgroundColor = UIColorFromRGB(0xFFF3E7)
        self.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 0.5))
        lblTitle?.textColor = UIColorFromRGB(0x4B4D52)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    class var reuseIdentifier: String {
        get {
            return "DataCell"
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
