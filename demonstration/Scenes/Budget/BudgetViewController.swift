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
    
    let mockContent = [
        BudgetCellViewModel(categoryName: "Restaurants", categoryBudget: "$ 500.00", categoryBudgetRemaining: "$ -41.50", totalSpent: "$ 541.50", color: .brown, fillPercent: 120),
        BudgetCellViewModel(categoryName: "Groceries", categoryBudget: "$ 300.00", categoryBudgetRemaining: "$ 159.70", totalSpent: "$ 140.30", color: .systemPink, fillPercent: 40),
        BudgetCellViewModel(categoryName: "Leisure", categoryBudget: "$ 500.00", categoryBudgetRemaining: "$ 261.50", totalSpent: "$ 238.50", color: ColorTheme.secondaryAccent.color, fillPercent: 70)
    ]
    
    init(presenter: BudgetPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view = contentView
        view.backgroundColor = ColorTheme.primaryColor.color
        contentView.tableViewDataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not supported")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BudgetViewController: BudgetPresenterDelegate {
    func presentSuccess(viewModel: BudgetModels.ViewModel) {
    }
    
    func presentError(_ error: NetworkErrors) {
    }
}

extension BudgetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BudgetCell(style: .default, reuseIdentifier: cellIdentifier)
        cell.setupCell(mockContent[indexPath.row])
        return cell
    }
}
