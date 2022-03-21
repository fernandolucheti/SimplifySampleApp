//
//  VerticalTabBarService.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Moya

protocol VerticalTabBarServiceLogic {
    func fetch(completion: @escaping (VerticalTabBarModels.Response) -> Void)
}

class VerticalTabBarService: VerticalTabBarServiceLogic {
    
    var provider: MoyaProvider<NetworkRequests>
    
    init(provider: MoyaProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(completion: @escaping (VerticalTabBarModels.Response) -> Void) {
        provider.request(.budgetBar) { result in
            if case .success(let response) = result {
                guard let responseModel = try? response.map(VerticalTabBarModels.Response.self) else { return }
                completion(responseModel)
            }
        }
    }
}
