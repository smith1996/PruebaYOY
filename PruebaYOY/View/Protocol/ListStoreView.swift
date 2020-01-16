//
//  ListStoreView.swift
//  PruebaYOY
//
//  Created by Smith Huamani Hilario on 1/16/20.
//  Copyright © 2020 YOY. All rights reserved.
//

import Foundation

protocol ListStoreViewDelegate: NSObjectProtocol {
    func showStores(stores: [StoreData])
    func emptyStore()
    func errorService(message : String)
}
