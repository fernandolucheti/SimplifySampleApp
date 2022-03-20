//
//  TransactionsService.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import Moya

protocol TransactionsServiceLogic {
    func fetch(completion: @escaping (Result<TransactionModels.Response, NetworkErrors>) -> Void)
}

final class TransactionsService: TransactionsServiceLogic {
    
    var provider: MoyaProvider<NetworkRequests>
    
    init(provider: MoyaProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(completion: @escaping (Result<TransactionModels.Response, NetworkErrors>) -> Void) {
        provider.request(.transactions) { result in
            switch result {
            case.success(let response):
                do {
                    let responseModel = try response.map(TransactionModels.Response.self)
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
