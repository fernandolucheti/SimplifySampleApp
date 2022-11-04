//
//  KeyViewModel.swift
//  demonstration
//
//  Created by Fernando Lucheti on 04/11/22.
//

import Foundation

struct KeyViewModel: Hashable, Identifiable {
    var id = UUID()
    var key: String?
    var icon: SystemIcons?
    
    var didTapKey: ((String) -> Void)?
    var didTapAction: (() -> Void)?
    
    init(_ key: Int) {
        self.key = "\(key)"
    }
    
    init(_ icon: SystemIcons, didTapAction: @escaping () -> Void) {
        self.icon = icon
        self.didTapAction = didTapAction
    }
    
    
    static func == (lhs: KeyViewModel, rhs: KeyViewModel) -> Bool {
        lhs.key == rhs.key && lhs.icon == rhs.icon
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
}
