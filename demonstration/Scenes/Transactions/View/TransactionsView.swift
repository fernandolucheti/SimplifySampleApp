//
//  TransactionsView.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

final class TransactionsView: UIView {
    
    var didSelectMonth: (MonthYear) -> Void
    
    weak var tableViewDataSource: UITableViewDataSource? {
        didSet {
            tableView.dataSource = tableViewDataSource
        }
    }
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.secondaryColor.color
        return view
    }()
    
    private lazy var headerView = HeaderView(didSelectMonthBlock: { monthYear in
        self.didSelectMonth(monthYear)
    })
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        let offset: CGFloat = 40
        tableView.contentInset = UIEdgeInsets(top: offset, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: offset)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    init(didSelectMonthBlock: @escaping (MonthYear) -> Void) {
        self.didSelectMonth = didSelectMonthBlock
        super.init(frame: .zero)
        setupView()
        tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension TransactionsView: ViewCode {
    func setupHierarchy() {
        addSubview(lineView)
        addSubview(tableView)
        addSubview(headerView)
    }
    
    func setupConstraints() {
        lineView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            lineView.widthAnchor.constraint(equalToConstant: 10),
            lineView.topAnchor.constraint(equalTo: topAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureView() {
        backgroundColor = ColorTheme.primaryColor.color
        headerView.title = "Transactions"
    }
}
