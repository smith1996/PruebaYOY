//
//  ViewController.swift
//  PruebaYOY
//
//  Created by Smith Huamani Hilario on 1/16/20.
//  Copyright © 2020 YOY. All rights reserved.
//

import UIKit

class DetailStoreViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    lazy var data: StoreData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = data {
            logoImageView.sd_setImage(with: URL(string: item.logoURL)!, completed: nil)
            nameLabel.text = "🙍🏻‍♂️ \(item.name)"
            cityLabel.text = "🌃 \(item.city), \(item.state)"
            addressLabel.text = "🏠 \(item.address)"
        }
        
    }

}

