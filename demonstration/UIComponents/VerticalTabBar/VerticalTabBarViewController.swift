//
//  VerticalTabBarViewController.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class VerticalTabBarViewController: UIViewController {
    
    var contentViewController: UIViewController
    let navigationItens: [NavigationTabItem]
    let verticalTabBarView: VerticalTabBarView
    let presenter: VerticalTabBarPresenter
    
    init(navigationItens: [NavigationTabItem], presenter: VerticalTabBarPresenter) {
        self.contentViewController = navigationItens.first?.viewController ?? UIViewController()
        self.navigationItens = navigationItens
        self.presenter = presenter
        let viewItens = VerticalTabBarButtonsFactory.createButtonsFor(navigationItens)
        verticalTabBarView = VerticalTabBarView(buttons: viewItens)
        super.init(nibName: nil, bundle: nil)
        verticalTabBarView.setDelegate(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.fetch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        
        for view in verticalTabBarView.contentView.subviews {
            view.removeFromSuperview()
        }
        let shouldAddChildViewController = !children.contains(where: { viewController in
            viewController == contentViewController
        })
        if shouldAddChildViewController {
            addChild(contentViewController)
        }
        contentViewController.willMove(toParent: self)
        verticalTabBarView.contentView.addSubview(contentViewController.view)
        contentViewController.didMove(toParent: self)
    }
}

extension VerticalTabBarViewController: VerticalTabBarPresenterDelegate {
    func presentSuccess(viewModel: VerticalTabBarModels.ViewModel) {
        verticalTabBarView.setupView(viewModel)
    }
}

extension VerticalTabBarViewController: TabViewDelegate {
    
    func didSelectTabAtIndex(_ index: Int) {
        contentViewController = navigationItens[index].viewController
        setupView()
    }
}

extension VerticalTabBarViewController: ViewCode {
    func setupHierarchy() {
        view = verticalTabBarView
        setupContentView()
    }
    
    func setupConstraints() {
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentViewController.view.leadingAnchor.constraint(equalTo: verticalTabBarView.contentView.leadingAnchor),
            contentViewController.view.trailingAnchor.constraint(equalTo: verticalTabBarView.contentView.trailingAnchor),
            contentViewController.view.topAnchor.constraint(equalTo: verticalTabBarView.contentView.topAnchor),
            contentViewController.view.bottomAnchor.constraint(equalTo: verticalTabBarView.contentView.bottomAnchor)
        ])
    }
    
    func configureView() {
        verticalTabBarView.backgroundColor = ColorTheme.tertiaryColor.color
    }
}
