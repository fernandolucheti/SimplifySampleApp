//
//  BudgetService.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol BudgetServiceLogic {
    func fetch(monthYear: MonthYear, completion: @escaping (Result<BudgetModels.Response, NetworkErrors>) -> Void)
}

class BudgetService: BudgetServiceLogic {
    
    var provider: NetworkProvider<NetworkRequests>
    
    init(provider: NetworkProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(monthYear: MonthYear, completion: @escaping (Result<BudgetModels.Response, NetworkErrors>) -> Void) {
        provider.request(.budget(monthYear: monthYear), completion: completion)
    }
}
