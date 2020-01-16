//
//  UAlertsManager.swift
//  PruebaYOY
//
//  Created by Smith Huamani Hilario on 1/16/20.
//  Copyright © 2020 YOY. All rights reserved.
//

import UIKit

typealias AlertCompletionBlock = () -> Void

class UAlertsManager {
    
    static let shared = UAlertsManager()
    
    func showBasicAlertView(view: UIViewController,title:String, message:String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Prueba YOY", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        view.present(alertController, animated: true, completion: nil)
        
    }
    
    func showAlertViewWithCallBack(view: UIViewController,title:String, message:String, buttonnTitle:String,completion: @escaping AlertCompletionBlock){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let aceptAction = UIAlertAction(title: buttonnTitle, style: .default ) { (action:UIAlertAction!) in
            completion()
        }
        alertController.addAction(aceptAction)
        
        view.present(alertController, animated: true, completion:nil)
    }
    
    func showAlertViewWithDecision(view: UIViewController,title:String, message:String, firstButtonnTitle:String, secondButtonnTitle:String, firstCompletion: @escaping AlertCompletionBlock, secondCompletion: @escaping AlertCompletionBlock){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: firstButtonnTitle, style: .default) { (action:UIAlertAction!) in
            
            firstCompletion()
            
        }
        alertController.addAction(firstAction)
        
        let secondAction = UIAlertAction(title: secondButtonnTitle, style: .default) { (action:UIAlertAction!) in
            secondCompletion()
        }
        
        alertController.addAction(secondAction)
        view.present(alertController, animated: true, completion:nil)
    }
}
