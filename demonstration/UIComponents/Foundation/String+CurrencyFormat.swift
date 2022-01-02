//
//  String+CurrencyFormat.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import Foundation

extension Double {
    func currencyString() -> String {
        let intValue = Int(self)
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: Locale.current.identifier)
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        return numberFormatter.string(from: NSNumber(value: intValue)) ?? ""
    }
}

