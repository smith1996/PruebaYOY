//
//  ListStorePresenter.swift
//  PruebaYOY
//
//  Created by Smith Huamani Hilario on 1/16/20.
//  Copyright © 2020 YOY. All rights reserved.
//

import Foundation

protocol ListStoreViewPresenter {
    func setViewDelegate(delegate: ListStoreViewDelegate?)
    func getStores()
}

public class ListStorePresenter: ListStoreViewPresenter {
    
    private let service: ListStoreDataService
    weak private var delegate: ListStoreViewDelegate?
    
    lazy var arrayOfStore = [StoreData]()
    
    init(service: ListStoreDataService) {
        self.service = service
    }
    
    func setViewDelegate(delegate: ListStoreViewDelegate?) {
        self.delegate = delegate
    }
    
    func getStores() {
        
        self.service.fetchStores { [weak self] result in
         
            switch result {
            case .success(let item):
            
                DispatchQueue.main.async(execute: {
                    guard let store = self else {
                        return
                    }
                    
                    guard item.listOfStore.count != 0 else {
                        //Metodo Lista Vacia
                        store.delegate?.emptyStore()
                        return
                    }
                    
                    //Metodo Lista Llena
                    store.delegate?.showStores(stores: item.listOfStore)
                })
                break
            case .failure(let error):
                DispatchQueue.main.async(execute: {
                    guard let store = self else {
                        return
                    }
                    store.delegate?.errorService(message: error.localizedDescription)
                })
                break
            }
            
        }
        
    }
    
}
