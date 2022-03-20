//
//  PieChartModels.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum PieChartModels {
    struct Request: Codable {
    }
    
    struct Response: Decodable {
    }
    
    struct ErrorModel: Decodable, Error {
    }
    
    struct ViewModel {
    }
}
