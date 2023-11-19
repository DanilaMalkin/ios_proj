//
//  ShopTableManager.swift
//  ios_proj
//
//  Created by Danila on 18.11.2023.
//

import UIKit


final class ShopTableManager: NSObject{
    var tableData: [ItemDTO] = []
}

// MARK: - UIViewDataSourse

extension ShopTableManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
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
    
    

