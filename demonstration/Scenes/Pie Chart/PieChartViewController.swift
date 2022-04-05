//
//  PieChartViewController.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: UIViewController {
    
    private var viewModel: PieChartModels.ViewModel?
    private lazy var contentView = ChartView(didSelectMonthBlock: { [weak self] monthYear in
        self?.presenter.fetch(monthYear: monthYear)
        self?.view.setLoading(true, alpha: 0.4)
    })
    private var presenter: PieChartPresenter
    private let cellIdentifier = "PieChartCell"
    
    init(presenter: PieChartPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not supported")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = contentView
        view.backgroundColor = ColorTheme.primaryColor.color
        presenter.fetch(monthYear: Date.currentMonthYear)
        view.setLoading(true)
        contentView.tableViewDataSource = self
    }
}

extension PieChartViewController: PieChartPresenterDelegate {
    func presentSuccess(viewModel: PieChartModels.ViewModel) {
        self.viewModel = viewModel
        contentView.reloadData()
        view.setLoading(false)
    }
    
    func presentError(_ error: NetworkErrors) {
        view.setLoading(false)
    }
}

extension PieChartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel?.categories.count else { return 0 }
        return count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0, let viewModel = viewModel {
            let cell = PieChartCell(style: .default, reuseIdentifier: cellIdentifier)
            cell.set(data: PieChartDataApapter.convertData(viewModel))
            return cell
        }
        let cell = CategoryCell()
        cell.viewModel = viewModel?.categories[indexPath.row - 1]
        return cell
    }
}
