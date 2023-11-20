//
//  ShopTableView.swift
//  ios_proj
//
//  Created by Danila on 18.11.2023.
//

import UIKit

final class ShopTableView: UIView{
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
       
        return tableView
    }()
    
    private lazy var spinnerView = UIActivityIndicatorView(style: .large)
    
    private lazy var tableManager = ShopTableManager()
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews()
        makeConstraints()
        spinnerView.startAnimating()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [ItemDTO]) {
        tableManager.tableData = viewModel

        spinnerView.stopAnimating()
        tableView.reloadData()
    }
}

private extension ShopTableView{
    func addSubviews(){
        [tableView, spinnerView].forEach{
            self.addSubview($0)
        }
    }
    func makeConstraints(){
        [tableView, spinnerView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            spinnerView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
}
