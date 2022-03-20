//
//  PieChartModels.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum PieChartModels {
    
    struct Response: Decodable {
        let categories: [Category]
    }
    
    struct Category: Decodable {
        let name: String
        let color: String
        let totalSpent: Double
        
        private enum CodingKeys : String, CodingKey {
            case name, color = "color_hex", totalSpent = "total_spent"
        }
    }
    
    struct ViewModel {
        let categories: [CategoryViewModel]
    }
    
    struct CategoryViewModel {
        let name: String
        let color: UIColor
        let totalSpent: Double
    }
}
