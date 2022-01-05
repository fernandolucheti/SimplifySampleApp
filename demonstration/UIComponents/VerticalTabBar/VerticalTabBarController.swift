//
//  VerticalTabBarController.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

final class VerticalTabBarController: UIViewController {
    
    var contentViewController: UIViewController
    let navigationItens: [NavigationTabItem]
    let verticalTabBarView: VerticalTabBarView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    init(navigationItens: [NavigationTabItem]) {
        self.contentViewController = navigationItens.first?.viewController ?? UIViewController()
        self.navigationItens = navigationItens
        verticalTabBarView = VerticalTabBarView(itens: navigationItens)
        super.init(nibName: nil, bundle: nil)
        verticalTabBarView.setDelegate(self)
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

extension VerticalTabBarController: TabViewDelegate {
    
    func didSelectTabAtIndex(_ index: Int) {
        contentViewController = navigationItens[index].viewController
        setupView()
    }
}

extension VerticalTabBarController: ViewCode {
    func setupHierarchy() {
        view = verticalTabBarView
        setupContentView()
    }
    
    func setupConstraints() {
        view.translatesAutoresizingMaskIntoConstraints = false
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentViewController.view.leadingAnchor.constraint(equalTo: verticalTabBarView.contentView.leadingAnchor),
            contentViewController.view.trailingAnchor.constraint(equalTo: verticalTabBarView.contentView.trailingAnchor),
            contentViewController.view.topAnchor.constraint(equalTo: verticalTabBarView.contentView.topAnchor),
            contentViewController.view.bottomAnchor.constraint(equalTo: verticalTabBarView.contentView.bottomAnchor)
        ])
    }
    
    func configureView() {
        verticalTabBarView.backgroundColor = .tertiaryColor
    }
}
