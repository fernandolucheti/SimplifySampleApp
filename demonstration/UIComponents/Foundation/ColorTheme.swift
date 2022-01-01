//
//  ColorTheme.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

extension UIColor {
    
    static var primaryColor: UIColor {
        UIColor(hex: "#ffffff") ?? UIColor.clear
    }
    
    static var secondaryColor: UIColor {
        UIColor(hex: "#c1c1c1") ?? UIColor.clear
    }
    
    static var primaryAccent: UIColor {
        UIColor(hex: "#3083fb") ?? UIColor.clear
    }
    
    static var secondaryAccent: UIColor {
        UIColor(hex: "#f9777e") ?? UIColor.clear
    }
}

