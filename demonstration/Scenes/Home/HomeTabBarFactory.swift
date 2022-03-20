//
//  HomeTabBarFactory.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

final class HomeTabBarFactory {
    static func createViewController() -> UIViewController {
        
        func systemImage(_ name: String, filled: Bool = false) -> UIImage {
            let name = filled ? "\(name).fill" : name
            let image = UIImage(systemName: name,
                               withConfiguration: UIImage.SymbolConfiguration(pointSize: 28)) ?? UIImage()
            return image.withTintColor(ColorTheme.primaryAccent.color)
        }
        
        let tabItens = [
            NavigationTabItem(icon: systemImage(SystemIcons.dollarSign.rawValue),
                              iconFilled: systemImage(SystemIcons.dollarSign.rawValue, filled: true),
                              viewController: HomeFactory.createViewController()),
                        
            NavigationTabItem(icon: systemImage(SystemIcons.list.rawValue),
                              iconFilled: systemImage(SystemIcons.list.rawValue, filled: true),
                              viewController: TransactionsFactory.createViewController()),
            
            NavigationTabItem(icon: systemImage(SystemIcons.pieChart.rawValue),
                              iconFilled: systemImage(SystemIcons.pieChart.rawValue, filled: true),
                              viewController: PieChartFactory.createViewController()),
            
            NavigationTabItem(icon: systemImage(SystemIcons.tag.rawValue),
                              iconFilled: systemImage(SystemIcons.tag.rawValue, filled: true),
                              viewController: BudgetFactory.createViewController())
        ]
        
        return VerticalTabBarController(navigationItens: tabItens)
    }
}
