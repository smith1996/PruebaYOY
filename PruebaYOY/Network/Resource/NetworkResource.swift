//
//  NetworkResource.swift
//  PruebaYOY
//
//  Created by Smith Huamani Hilario on 1/16/20.
//  Copyright © 2020 YOY. All rights reserved.
//

import Foundation

public struct Resource {
    var url: String
    var body: Data?
    var method: Method
    var headers: [String: String]
}

extension Resource {
    
    init(url: String, params: Data? = nil, method: Method) {
        self.url = url
        self.body = params
        self.method = method
        self.headers = ["Content-Type": "application/json"]
    }
    
}

// TODO: - Move to the separated file URLRequest+Resource.swift

extension URLRequest {
    
    init(_ resource: Resource) {

        self.init(url: URL(string: resource.url)!)
        self.httpMethod = resource.method.rawValue
        self.httpBody = resource.body
        self.allHTTPHeaderFields = resource.headers
    }
    
}
