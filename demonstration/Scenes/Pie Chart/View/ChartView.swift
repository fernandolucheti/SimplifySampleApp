//
//  ChartView.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ChartView: UIView {
    
    weak var tableViewDataSource: UITableViewDataSource? {
        didSet {
            tableView.dataSource = tableViewDataSource
        }
    }
    
    private let headerView = HeaderView()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        let offset: CGFloat = 50
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: offset, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: offset)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension ChartView: ViewCode {
    func setupHierarchy() {
        addSubview(tableView)
        addSubview(headerView)
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureView() {
        headerView.title = "Expense Graph"
    }
}

extension ChartView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? 350 : 80
    }
}
