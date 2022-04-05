//
//  TransactionsService.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import Moya
import Foundation

protocol TransactionsServiceLogic {
    func fetch(monthYear: MonthYear, completion: @escaping (Result<TransactionModels.Response, NetworkErrors>) -> Void)
}

final class TransactionsService: TransactionsServiceLogic {
    
    var provider: MoyaProvider<NetworkRequests>
    
    init(provider: MoyaProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(monthYear: MonthYear, completion: @escaping (Result<TransactionModels.Response, NetworkErrors>) -> Void) {
        
        provider.request(.transactions(monthYear: monthYear)) { result in
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
