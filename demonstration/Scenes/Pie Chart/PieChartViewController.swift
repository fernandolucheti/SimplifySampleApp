//
//  PieChartViewController.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {
    
    private lazy var contentView = PieChartView()
    private var presenter: PieChartPresenter
    
    
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
    }
}

extension PieChartViewController: PieChartPresenterDelegate {
    func presentSuccess(viewModel: PieChartModels.ViewModel) {
    }
    
    func presentError(_ error: NetworkErrors) {
    }
}
