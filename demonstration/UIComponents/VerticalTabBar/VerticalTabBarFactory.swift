//
//  VerticalTabBarFactory.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Moya

final class VerticalTabBarFactory {
    
    private static func systemImage(_ name: String, filled: Bool = false) -> UIImage {
        let name = filled ? "\(name).fill" : name
        let image = UIImage(systemName: name,
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 28)) ?? UIImage()
        return image.withTintColor(ColorTheme.primaryAccent.color)
    }
    
    private static func createNavigationTabItens() -> [NavigationTabItem] {
        [
            NavigationTabItem(icon: systemImage(SystemIcons.dollarSign.rawValue),
                              iconFilled: systemImage(SystemIcons.dollarSign.rawValue, filled: true),
                              viewController: HomeFactory.createViewController()),
            
            NavigationTabItem(icon: systemImage(SystemIcons.tag.rawValue),
                              iconFilled: systemImage(SystemIcons.tag.rawValue, filled: true),
                              viewController: BudgetFactory.createViewController()),
            
            NavigationTabItem(icon: systemImage(SystemIcons.pieChart.rawValue),
                              iconFilled: systemImage(SystemIcons.pieChart.rawValue, filled: true),
                              viewController: PieChartFactory.createViewController())
        ]
    }
    
    static func createViewController() -> UIViewController {
        let provider = MoyaProvider<NetworkRequests>()
        let service = VerticalTabBarService(provider: provider)
        let presenter = VerticalTabBarPresenter(service: service)
        let viewController = VerticalTabBarViewController(navigationItens: createNavigationTabItens(), presenter: presenter)
        presenter.setDelegate(viewController)
        return viewController
    }
}
