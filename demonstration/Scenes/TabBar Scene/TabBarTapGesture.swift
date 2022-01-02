//
//  TabBarTapGesture.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

class TabBarTapGesture: UITapGestureRecognizer {
    
    let button: UIButton
    let index: Int
    
    init(button: UIButton, index: Int, target: Any, action: Selector?) {
        self.button = button
        self.index = index
        super.init(target: target, action: action)
    }
}
