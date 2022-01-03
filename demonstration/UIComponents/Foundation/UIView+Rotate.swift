//
//  UIView+Rotate.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

extension UIView {

    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }

}
