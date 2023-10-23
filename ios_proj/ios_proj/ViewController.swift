//
//  ViewController.swift
//  ios_proj
//
//  Created by Danila on 09.10.2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        let url: URL = URL(string: "https://fakestoreapi.com/products")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                let response,
                error == nil
            else{
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            //let jsonModel = decoder.
            let model = try! decoder.decode([ItemDTO].self, from: data)
            print(model)
            
        }).resume()
    
        
        
    }


}

struct ItemDTO: Decodable{
    let id: Int
    let title: String
    let price: Double
    let image: URL
    
}

