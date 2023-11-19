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
        return view
    }()
    
    private let service = ShopService()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchShop { items in
            DispatchQueue.main.async {
                self.contentView.configure(with: items)
                
            }
        }
    }
}



/*extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
*/
