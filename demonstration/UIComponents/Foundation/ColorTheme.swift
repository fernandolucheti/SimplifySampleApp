//
//  ColorTheme.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

extension UIColor {
    
    static var primaryColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ?
            UIColor(hex: "#121212") : UIColor(hex: "#f7f7f7")
        }
    }
    
    static var secondaryColor: UIColor {
        UIColor.systemGray2
    }
    
    static var tertiaryColor: UIColor {
        UIColor.systemBackground
    }
    
    static var primaryAccent: UIColor {
        UIColor(hex: "#3083fb")
    }
    
    static var secondaryAccent: UIColor {
        UIColor(hex: "#f9777e")
    }
}


