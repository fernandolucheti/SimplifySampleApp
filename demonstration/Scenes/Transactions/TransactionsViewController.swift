//
//  TransactionsViewController.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

final class TransactionsViewController: UIViewController {
    
    let presenter: TransactionsPresenter
    
    private lazy var transactionsView = TransactionsView(didSelectMonthBlock: { [weak self] monthYear in
        self?.presenter.fetch(monthYear: monthYear)
        self?.view.setLoading(true, alpha: 0.4)
    })
    
    var transactions: [TransactionCellViewModel] = [] {
        didSet {
            transactionsView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionsView.tableViewDataSource = self
        view = transactionsView
        presenter.fetch(monthYear: Date.currentMonthYear)
        transactionsView.setLoading(true)
    }
    
    init(presenter: TransactionsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransactionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = transactions[indexPath.row]
        let cell = TransactionCell(style: .default, reuseIdentifier: "transactionCell", viewModel: viewModel)
        cell.viewModel = viewModel
        return cell
    }
}

extension TransactionsViewController: TransactionsPresenterDelegate {
    func presentSuccess(viewModel: TransactionModels.ViewModel) {
        transactions = viewModel.transactions
        transactionsView.setLoading(false)
    }
    
    func presentError(_ error: NetworkErrors) {
        transactionsView.setLoading(false)
    }
}
