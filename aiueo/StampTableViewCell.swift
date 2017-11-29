//
//  StampTableCellTableViewCell.swift
//  aiueo
//
//  Created by 兼子友花 on 2017/11/22.
//  Copyright © 2017年 兼子友花. All rights reserved.
//

import UIKit
import RealmSwift

class StampTableViewCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var stampImageView: UIImageView!
    
    var imageName: String!
    

        
    override func awakeFromNib() {
        
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
