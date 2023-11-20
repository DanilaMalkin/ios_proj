//
//  ShopTableManager.swift
//  ios_proj
//
//  Created by Danila on 18.11.2023.
//

import UIKit

protocol ShopTableManagerDelegate {
    func didSelectRow(_ shopModel : ItemDTO)
    
}


final class ShopTableManager: NSObject{
    var delegate: ShopTableManagerDelegate?
    var tableData: [ItemDTO] = []
}

// MARK: - UIViewDataSourse

extension ShopTableManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableData[indexPath.row]
        var cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.image = UIImage()
        configuration.text = item.title
        configuration.secondaryText = String(item.price)
        cell.contentConfiguration = configuration
        return cell
    }
}

extension ShopTableManager : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let shopModel = tableData[indexPath.row]
        delegate?.didSelectRow(shopModel)
    }
}


    
    

