//
//  Text+Syles.swift
//  demonstration
//
//  Created by Fernando Lucheti on 04/11/22.
//

import UIKit
import SwiftUI

extension Text {
    func primaryXL() -> some View {
        self
            .font(.system(size: 30))
            .foregroundColor(.gray)
    }
    
    func primaryXXL() -> some View {
        self
            .font(.system(size: 35))
            .foregroundColor(.gray)
    }
}
