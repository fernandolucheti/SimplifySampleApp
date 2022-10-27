//
//  HomeBudgetBarModels.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum HomeBudgetBarModels {
    
    struct Response: Decodable {
        let categories: [Category]
    }
    
    struct Category: Decodable {
        let color: String
        let totalSpent: Double
        
        private enum CodingKeys : String, CodingKey {
            case color = "color_hex", totalSpent = "total_spent"
        }
    }
    
    struct ViewModel {
        let categories: [CategoryViewModel]
        var totalSpentSum: Double {
            categories.compactMap({ $0.totalSpent }).reduce(0, +)
        }
    }
    
    struct CategoryViewModel {
        let color: String
        let totalSpent: Double
    }
}
