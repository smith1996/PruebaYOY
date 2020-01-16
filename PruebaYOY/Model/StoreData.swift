//
//  Store.swift
//  PruebaYOY
//
//  Created by Smith Huamani Hilario on 1/16/20.
//  Copyright © 2020 YOY. All rights reserved.
//

import Foundation

struct StoreResponse: Codable {
    let listOfStore: [StoreData]
    
    public enum CodingKeys: String, CodingKey {
        case listOfStore = "stores"
    }
}

struct StoreData: Codable {
    var address: String = ""
    var city: String = ""
    var name: String = ""
    var latitude: String = ""
    var zipcode: String = ""
    var logoURL: String = ""
    var phone: String = ""
    var longitude: String = ""
    var id: String = ""
    var state: String = ""
    
    public enum CodingKeys: String, CodingKey {
        case address = "address"
        case city = "city"
        case name = "name"
        case latitude = "latitude"
        case zipcode = "zipcode"
        case logoURL = "storeLogoURL"
        case phone = "phone"
        case longitude = "longitude"
        case id = "storeID"
        case state = "state"
    }
}
