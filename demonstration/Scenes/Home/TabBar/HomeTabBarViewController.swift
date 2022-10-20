//
//  HomeTabBarViewController.swift
//  demonstration
//
//  Created by Fernando Lucheti on 19/10/22.
//

import UIKit

final class HomeTabBarController: VerticalTabBarViewController {
    
    let presenter: HomeBudgetBarPresenter
    
    let budgetBar: BudgetBarView = {
        let view = BudgetBarView()
        view.backgroundColor = ColorTheme.secondaryColor.color
        return view
    }()
    
    init(navigationItens: [NavigationTabItem], presenter: HomeBudgetBarPresenter) {
        self.presenter = presenter
        super.init(navigationItens: navigationItens)
        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.fetch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeTabBarController: VerticalTabBarPresenterDelegate {
    func presentSuccess(viewModel: VerticalTabBarModels.ViewModel) {
        budgetBar.viewModel = viewModel
    }
}

extension HomeTabBarController {
    
    override func setupHierarchy() {
        super.setupHierarchy()
        view.addSubview(budgetBar)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        budgetBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            budgetBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            budgetBar.topAnchor.constraint(equalTo: view.topAnchor),
            budgetBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            budgetBar.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    override func configureView() {
        tabBarBackgroundColor = ColorTheme.tertiaryColor.color
        contentBackGroundColor = ColorTheme.tertiaryColor.color
        view.clipsToBounds = false
    }
}
