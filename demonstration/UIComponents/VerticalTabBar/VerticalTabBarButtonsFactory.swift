//
//  VerticalTabBarButtonFactory.swift
//  demonstration
//
//  Created by Fernando on 10/01/22.
//

import UIKit

final class VerticalTabBarButtonsFactory {
    static func createButtonsFor(_ itens: [NavigationTabItem]) -> [UIButton] {
        itens.enumerated().map { (index, item) in
            let button = UIButton()
            button.setImage(item.icon, for: .normal)
            button.setImage(item.iconFilled, for: .selected)
            button.isSelected = index == 0
            return button
        }
    }
}
