//
//  ColorTheme.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

enum ColorTheme: String {
    case primaryAccent
    case secondaryAccent
    case primaryColor
    case secondaryColor
    case tertiaryColor
    
    var color: UIColor {
        UIColor(named: rawValue) ?? .clear
    }
}

