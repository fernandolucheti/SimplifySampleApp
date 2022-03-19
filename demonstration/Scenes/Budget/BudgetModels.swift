//
//  BudgetModels.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum BudgetModels {
    struct Request: Codable {
    }
    
    struct Response: Decodable {
    }
    
    struct ErrorModel: Decodable, Error {
    }
    
    struct ViewModel {
    }
}
