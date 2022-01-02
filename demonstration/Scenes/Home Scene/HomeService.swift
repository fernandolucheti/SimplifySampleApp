//
//  HomeService.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import Moya

protocol HomeServiceLogic: AnyObject {
    func fetch(completion: @escaping (Result<HomeModels.Response, Error>) -> Void)
}

final class HomeService: HomeServiceLogic {
    
    var provider: MoyaProvider<NetworkRequests>
    
    init(provider: MoyaProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(completion: @escaping (Result<HomeModels.Response, Error>) -> Void) {
        provider.request(.home) { result in
            switch result {
            case.success(let response):
                do {
                    let responseModel = try response.map(HomeModels.Response.self)
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

