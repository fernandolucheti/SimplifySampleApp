//
//  BudgetViewController.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {
    
    private lazy var contentView = BudgetView()
    private var presenter: BudgetPresenter
    
    let cellIdentifier = "BudgetCell"
    var categories = [BudgetCellViewModel]() {
        didSet {
            contentView.reloadData()
        }
    }
    
    init(presenter: BudgetPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not supported")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        view.backgroundColor = ColorTheme.primaryColor.color
        contentView.tableViewDataSource = self
        presenter.fetch()
        view.setLoading(true)
    }
}

extension BudgetViewController: BudgetPresenterDelegate {
    func presentSuccess(viewModel: BudgetModels.ViewModel) {
        categories = viewModel.categories
        view.setLoading(false)
    }
    
    func presentError(_ error: NetworkErrors) {
        view.setLoading(false)
    }
}

extension BudgetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BudgetCell(style: .default, reuseIdentifier: cellIdentifier)
        cell.setupCell(categories[indexPath.row])
        return cell
    }
}
