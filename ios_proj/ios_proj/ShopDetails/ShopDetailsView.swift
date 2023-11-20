//
//  ShopDetailsView.swift
//  ios_proj
//
//  Created by Danila on 20.11.2023.
//
import UIKit
import Foundation

final class ShopDetailsView: UIView{
    
    var shopModel: ItemDTO?
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private lazy var subtitleView: UILabel = {
        let view = UILabel()
        return view
    }()
   
    
    lazy var titleView: UILabel = {
        let view = UILabel()
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .systemMint
        addSubviews()
        makeConstrains()
        configure()
        print("Hello")
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        titleView.text = shopModel?.title
     
    }
    
    
}


    
    
private extension ShopDetailsView{
    func addSubviews() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(subtitleView)
        
    }
    
    func makeConstrains(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
            
        ])
    }
}
