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
    
    let tableView = UITableView()
    let cellIdentifier = "BudgetCell"
    
    let mockContent = [
        BudgetCellViewModel(categoryName: "Restaurantes", totalSpent: "R$ 541,50", color: .brown, fillPercent: 120),
        BudgetCellViewModel(categoryName: "Lazer", totalSpent: "R$ 140,30", color: .systemPink, fillPercent: 40),
        BudgetCellViewModel(categoryName: "Mercado", totalSpent: "R$ 238,50", color: ColorTheme.secondaryAccent.color, fillPercent: 70)
    ]
    
    init(presenter: BudgetPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view = tableView
        view.backgroundColor = ColorTheme.primaryColor.color
        tableView.register(BudgetCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.separatorStyle = .none
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
