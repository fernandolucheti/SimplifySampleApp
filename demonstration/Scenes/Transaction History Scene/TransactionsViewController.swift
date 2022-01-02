//
//  TransactionsViewController.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

final class TransactionsViewController: UIViewController {
    let transactionsView = TransactionsView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        transactionsView.tableViewDataSource = self
        view = transactionsView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransactionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = TransactionCellViewModel(value: 10.0, name: "restaurant", date: "01/01/2021", categoryName: "food", categoryColor: .red)
        let cell = TransactionCell(style: .default, reuseIdentifier: "transactionCell", viewModel: viewModel)
        cell.viewModel = viewModel
        return cell
    }
}
