//
//  BudgetService.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Moya

protocol BudgetServiceLogic {
    func fetch(monthYear: MonthYear, completion: @escaping (Result<BudgetModels.Response, NetworkErrors>) -> Void)
}

class BudgetService: BudgetServiceLogic {
    
    var provider: MoyaProvider<NetworkRequests>
    
    init(provider: MoyaProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(monthYear: MonthYear, completion: @escaping (Result<BudgetModels.Response, NetworkErrors>) -> Void) {
        provider.request(.budget(monthYear: monthYear)) { result in
            switch result {
            case.success(let response):
                do {
                    let responseModel = try response.map(BudgetModels.Response.self)
                    completion(.success(responseModel))
                } catch {
                    completion(.failure(NetworkErrors.decoding))
                }
            case .failure:
                completion(.failure(NetworkErrors.generic))
            }
        }
    }
}
