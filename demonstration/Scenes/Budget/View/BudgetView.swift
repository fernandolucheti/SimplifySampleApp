//
//  BudgetView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class BudgetView: UIView {
    
    weak var tableViewDataSource: UITableViewDataSource? {
        didSet {
            tableView.dataSource = tableViewDataSource
        }
    }
    
    private let headerView = HeaderView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        let offset: CGFloat = 50
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: offset, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: offset)
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension BudgetView: ViewCode {
    func setupHierarchy() {
        addSubview(tableView)
        addSubview(headerView)
    }
    
    func setupConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureView() {
        backgroundColor = ColorTheme.primaryColor.color
        headerView.title = "Categories"
    }
}
