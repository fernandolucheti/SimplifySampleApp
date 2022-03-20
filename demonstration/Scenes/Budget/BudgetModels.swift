//
//  BudgetModels.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum BudgetModels {
    
    struct Response: Decodable {
        let categories: [Category]
    }
    
    struct Category: Decodable {
        let name: String
        let color: String
        let budget: Double
        let totalSpent: Double
        let budgetRemaining: Double
        
        private enum CodingKeys : String, CodingKey {
            case name, color = "color_hex", budget, totalSpent = "total_spent", budgetRemaining = "budget_remaining"
        }
    }
    
    struct ViewModel {
        let categories: [BudgetCellViewModel]
    }
}
