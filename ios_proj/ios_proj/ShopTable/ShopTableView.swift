//
//  ShopTableView.swift
//  ios_proj
//
//  Created by Danila on 18.11.2023.
//

import UIKit

protocol ShopTableViewDelegate {
    func didSelectRow(_ beerModel: ItemDTO)
}

final class ShopTableView: UIView{
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = tableManager
        tableView.delegate = tableManager
        return tableView
    }()
    
    private lazy var spinnerView = UIActivityIndicatorView(style: .large)
    private lazy var tableManager = ShopTableManager()
    var delegate: ShopTableViewDelegate?
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .systemMint
        addSubviews()
        makeConstraints()
        spinnerView.startAnimating()
        tableManager.delegate = self
        print("ShopTableView delegate set")
    }
    
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [ItemDTO]) {
        print("ShopTableView configure with \(viewModel.count) items")
        tableManager.tableData = viewModel
        spinnerView.stopAnimating()
        tableView.reloadData()
    }
    
    
}

extension ShopTableView: ShopTableManagerDelegate {
    
    func didSelectRow(_ shopModel: ItemDTO) {
        delegate?.didSelectRow(shopModel)
    }
    
}

private extension ShopTableView{
    func addSubviews(){
        [tableView, spinnerView].forEach{
            self.addSubview($0)
        }
        print("ShopTableView added to superview")
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


