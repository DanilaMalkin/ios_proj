//
//  ShopService.swift
//  ios_proj
//
//  Created by Danila on 13.11.2023.
//

import Foundation

final class ShopService{
    let decodet = JSONDecoder()
    let session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        return session
        
        
    }()
    func fetchShop(complitionHandler: @escaping([ItemDTO]) -> Void){
        let url: URL = URL(string: "https://fakestoreapi.com/products")!
        session.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                error == nil
            else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let itemData = try! decoder.decode([ItemDTO].self, from: data)
            complitionHandler(itemData)
           
            
        }).resume()
        
    }
}

