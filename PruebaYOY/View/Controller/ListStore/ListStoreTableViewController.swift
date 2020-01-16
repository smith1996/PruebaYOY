//
//  StoreListTableViewController.swift
//  PruebaYOY
//
//  Created by Smith Huamani Hilario on 1/16/20.
//  Copyright © 2020 YOY. All rights reserved.
//

import UIKit

class ListStoreTableViewController: UITableViewController {

    var presenter = ListStorePresenter(service: ListStoreDataService())
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setViewDelegate(delegate: self)
        setupTableView(tableView: self.tableView, cell: "StoreCell")
        tableView.allowsSelection = true
        presenter.getStores()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.arrayOfStore.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreCell
        cell.configure(array: presenter.arrayOfStore, row: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetailStore", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowDetailStore":
            if let destionationVC = segue.destination as? DetailStoreViewController, let index = sender {
                destionationVC.data = presenter.arrayOfStore[index as! Int]
            }
            break
        default:
            break
        }
    }

}

extension ListStoreTableViewController: ListStoreViewDelegate {
    
    func showStores(stores: [StoreData]) {
        tableView.isHidden = false
        presenter.arrayOfStore = stores
        tableView.reloadData()
    }
    
    func emptyStore() {
        print("Lista Vacia")
        tableView.isHidden = true
        UAlertsManager.shared.showBasicAlertView(view: self, title: "Prueba YOY", message: "No se encontraron resultados")
    }
    
    func errorService(message: String) {
        print("Error del servicio :", message)
        UAlertsManager.shared.showBasicAlertView(view: self, title: "Prueba YOY", message: message)
        //Localizable.App.title.localized
    }
    
}

extension UIViewController {
    
    public func setupTableView(tableView: UITableView, header nameHeader: String? = nil, cell nameCell: String) {
            
        if let header = nameHeader {
            tableView.register(UINib(nibName: header, bundle: nil),
                                forHeaderFooterViewReuseIdentifier: header)
        }
            
        tableView.register(UINib(nibName: nameCell, bundle: nil),
                               forCellReuseIdentifier: nameCell)
            
        tableView.allowsSelection = (nameCell == "SummaryCell" ? true : false)
        tableView.reloadData()
    }
}
