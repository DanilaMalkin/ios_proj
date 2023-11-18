//
//  ShopModel.swift
//  ios_proj
//
//  Created by Danila on 18.11.2023.
//

struct ItemDTO: Decodable{
    let id: Int
    let title: String
    let price: Double
    let image: URL
    
}
