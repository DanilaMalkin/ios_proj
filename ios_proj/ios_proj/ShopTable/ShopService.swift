//
//  ShopService.swift
//  ios_proj
//
//  Created by Danila on 13.11.2023.
//

import Foundation

protocol ShopServicing: AnyObject{
    func fetchShop(complitionHandler: @escaping([ItemDTO]) -> Void)
}

final class ShopService {
    let decoder : JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    
    let session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        return session
        
    }()
}


    

extension ShopService : ShopServicing{
    func fetchShop(complitionHandler: @escaping ([ItemDTO]) -> Void){
        let url: URL = URL(string: "https://fakestoreapi.com/products")!
        session.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                error == nil
            else { return }
            
            let shopData = try! self.decoder.decode([ItemDTO].self, from: data)
            complitionHandler(shopData)
            
        }).resume()
        
        
    }
}



