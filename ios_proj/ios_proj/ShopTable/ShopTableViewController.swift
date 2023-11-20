//
//  ViewController.swift
//  ios_proj
//
//  Created by Danila on 09.10.2023.
//

import UIKit
import Foundation

final class ShopTableViewController: UIViewController {
    private lazy var contentView: ShopTableView = {
        let view = ShopTableView()
        view.delegate = self
        return view
    }()
    
    private let service : ShopServicing
    
    init(service: ShopServicing) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController viewDidLoad")
        service.fetchShop { items in
            DispatchQueue.main.async {
                self.contentView.configure(with: items)
                
            }
        }
    }
}


extension ShopTableViewController: ShopTableViewDelegate{
    func didSelectRow(_ shopModel: ItemDTO) {
        let factory = ShopDetailsViewControllerFactory()
        
        let vc = factory.build()
        vc.shopModel = shopModel
        present(vc, animated: true)
        
    }
    
    
}
   

   


