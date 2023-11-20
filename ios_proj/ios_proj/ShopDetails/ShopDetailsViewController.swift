//
//  ShopDetailsViewController.swift
//  ios_proj
//
//  Created by Danila on 20.11.2023.
//

import UIKit


class ShopDetailsViewController: UIViewController {
    
    var shopModel: ItemDTO?
    
    private lazy var contentView: ShopDetailsView = {
        let view = ShopDetailsView()
        
        return view
    }()
    
    
    
    override func loadView() {
        view = contentView
   }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configure()
        
    }
    func configure() {
            guard let title = shopModel?.title else {
                print("shopModel?.title is nil")
                return
            }
            contentView.titleView.text = title
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

