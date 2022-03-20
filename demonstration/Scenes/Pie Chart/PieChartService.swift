//
//  PieChartService.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Moya

protocol PieChartServiceLogic {
    func fetch(completion: @escaping (Result<PieChartModels.Response, NetworkErrors>) -> Void)
}

class PieChartService: PieChartServiceLogic {
    
    var provider: MoyaProvider<NetworkRequests>
    
    init(provider: MoyaProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(completion: @escaping (Result<PieChartModels.Response, NetworkErrors>) -> Void) {
        provider.request(.pieChart) { result in
            switch result {
            case.success(let response):
                do {
                    let responseModel = try response.map(PieChartModels.Response.self)
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
