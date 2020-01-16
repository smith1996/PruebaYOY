//
//  StoreCell.swift
//  PruebaYOY
//
//  Created by Smith Huamani Hilario on 1/16/20.
//  Copyright © 2020 YOY. All rights reserved.
//

import UIKit
import SDWebImage

class StoreCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure<T>(array: [T], row: Int) {
        let data = array[row] as! StoreData
        logoImageView.sd_setImage(with: URL(string: data.logoURL)!, completed: nil)
        phoneLabel.text = data.phone
        addressLabel.text = data.address
    }
    
}
