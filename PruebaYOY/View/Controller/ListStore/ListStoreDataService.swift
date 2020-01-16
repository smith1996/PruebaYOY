//
//  ListStoreDataService.swift
//  PruebaYOY
//
//  Created by Smith Huamani Hilario on 1/16/20.
//  Copyright © 2020 YOY. All rights reserved.
//

import Foundation

//typealias Result = ([StoreResponse]) -> Void

class ListStoreDataService {
    
    func fetchStores(completion: @escaping ((Result<StoreResponse>) -> Void)) {
        
        let resource = Resource(url: "http://sandbox.bottlerocketapps.com/BR_Android_CodingExam_2015_Server/stores.json", method: .GET)
        
        APIClient.shared.load(resource) { (result) in
            
            switch result {
            case .success(let data):
                
                do {
                    let store = try JSONDecoder().decode(StoreResponse.self, from: data)
                    completion(.success(store))
                } catch {
                    print("Error al Decodear la data: ", error.localizedDescription)
                    completion(.failure(error))
                }
                
            case .failure(let error):
                print("Fallo el servicio: ", error.localizedDescription)
                completion(.failure(error))
            }
        }
        
        
    }
    
}
