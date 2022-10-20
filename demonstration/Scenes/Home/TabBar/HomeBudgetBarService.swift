//
//  HomeBudgetBarService.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol HomeBudgetBarServiceLogic {
    func fetch(completion: @escaping (HomeBudgetBarModels.Response) -> Void)
}

class HomeBudgetBarService: HomeBudgetBarServiceLogic {
    
    var provider: NetworkProvider<NetworkRequests>
    
    init(provider: NetworkProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(completion: @escaping (HomeBudgetBarModels.Response) -> Void) {
        provider.request(.budgetBar) { (result: Result<HomeBudgetBarModels.Response, NetworkErrors>) in
            if case .success(let response) = result {
                completion(response)
            }
        }
    }
}
