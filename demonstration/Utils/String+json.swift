//
//  String+json.swift
//  demonstration
//
//  Created by Fernando on 03/01/22.
//

import Foundation

extension String {
    var json: Data? {
        guard let path = Simplify.bundle.path(forResource: self, ofType: "json") else {
            return nil
        }
        return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}
