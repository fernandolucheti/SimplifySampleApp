//
//  HomeTabFactory.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

final class HomeTabFactory {
    static func createViewController() -> UIViewController {
        
        func systemImage(_ name: String, filled: Bool = false) -> UIImage {
            let name = filled ? "\(name).fill" : name
            return UIImage(systemName: name,
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 28)) ?? UIImage()
        }
        
        let tabItens = [
            NavigationTabItem(icon: systemImage(SystemIcons.dollarSign.rawValue),
                              iconFilled: systemImage(SystemIcons.dollarSign.rawValue, filled: true),
                              viewController: HomeFactory.createViewController()),
                        
            NavigationTabItem(icon: systemImage(SystemIcons.list.rawValue),
                              iconFilled: systemImage(SystemIcons.list.rawValue, filled: true),
                              viewController: TransactionsFactory.createViewController())]
        
        return HomeTabViewController(navigationItens: tabItens)
    }
}
