//
//  HomeTabController.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import Foundation
import UIKit

final class HomeTabViewController: UIViewController {
    
    var contentViewController: UIViewController
    let navigationItens: [NavigationTabItem]
    let homeTabView: HomeTabView
    
    override func viewDidLoad() {
        setupView()
    }
    
    init(navigationItens: [NavigationTabItem]) {
        self.contentViewController = navigationItens.first?.viewController ?? UIViewController()
        self.navigationItens = navigationItens
        homeTabView = HomeTabView(itens: navigationItens)
        super.init(nibName: nil, bundle: nil)
        homeTabView.setDelegate(self)
        for item in navigationItens {
            addChild(item.viewController)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        for view in homeTabView.contentView.subviews {
            view.removeFromSuperview()
        }
        homeTabView.contentView.addSubview(contentViewController.view)
        contentViewController.didMove(toParent: self)
    }
}

extension HomeTabViewController: TabViewDelegate {
    
    func didSelectTabAtIndex(_ index: Int) {
        contentViewController = navigationItens[index].viewController
        setupView()
    }
}

extension HomeTabViewController: ViewCode {
    func setupHierarchy() {
        view = homeTabView
        setupContentView()
    }
    
    func setupConstraints() {
        view.translatesAutoresizingMaskIntoConstraints = false
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentViewController.view.leadingAnchor.constraint(equalTo: homeTabView.contentView.leadingAnchor),
            contentViewController.view.trailingAnchor.constraint(equalTo: homeTabView.contentView.trailingAnchor),
            contentViewController.view.topAnchor.constraint(equalTo: homeTabView.contentView.topAnchor),
            contentViewController.view.bottomAnchor.constraint(equalTo: homeTabView.contentView.bottomAnchor)
        ])
    }
}
