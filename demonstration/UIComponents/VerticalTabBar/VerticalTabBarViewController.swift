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
    
    var tabBarBackgroundColor: UIColor? {
        didSet {
            verticalTabBarView.backgroundColor = tabBarBackgroundColor
        }
    }
    
    var contentBackGroundColor: UIColor? {
        didSet {
            verticalTabBarView.contentBackGroundColor = contentBackGroundColor
        }
    }
    
    init(navigationItens: [NavigationTabItem]) {
        self.contentViewController = navigationItens.first?.viewController ?? UIViewController()
        self.navigationItens = navigationItens
        let viewItens = VerticalTabBarButtonsFactory.createButtonsFor(navigationItens)
        verticalTabBarView = VerticalTabBarView(buttons: viewItens)
        super.init(nibName: nil, bundle: nil)
        verticalTabBarView.setDelegate(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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

extension VerticalTabBarViewController: TabViewDelegate {
    
    func didSelectTabAtIndex(_ index: Int) {
        contentViewController = navigationItens[index].viewController
        setupView()
    }
}

extension VerticalTabBarViewController: ViewCode {
    @objc func setupHierarchy() {
        view = verticalTabBarView
        setupContentView()
    }
    
    @objc func setupConstraints() {
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentViewController.view.leadingAnchor.constraint(equalTo: verticalTabBarView.contentView.leadingAnchor),
            contentViewController.view.trailingAnchor.constraint(equalTo: verticalTabBarView.contentView.trailingAnchor),
            contentViewController.view.topAnchor.constraint(equalTo: verticalTabBarView.contentView.topAnchor),
            contentViewController.view.bottomAnchor.constraint(equalTo: verticalTabBarView.contentView.bottomAnchor)
        ])
    }
    
    @objc func configureView() { }
}
