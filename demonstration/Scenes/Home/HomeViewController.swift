//
//  ViewController.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let presenter: HomePresenter
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        presenter.fetch()
        homeView.setLoading(true)
    }
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeViewController: HomePresenterDelegate {
    func presentSuccess(viewModel: HomeModels.ViewModel) {
        homeView.setupView(viewModel)
        view.setLoading(false)
    }
    
    func presentError(_ error: NetworkErrors) {
        homeView.setLoading(false)
    }
}

