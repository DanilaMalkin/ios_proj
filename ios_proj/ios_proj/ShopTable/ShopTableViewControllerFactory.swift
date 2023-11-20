//
//  ShopTableViewControllerFactory.swift
//  ios_proj
//
//  Created by Danila on 20.11.2023.
//

final class ShopTableViewControllerFactory {
    func build() -> ShopTableViewController {
        let service = ShopService()
        let viewController = ShopTableViewController(service: service)
        return viewController
    }
}
