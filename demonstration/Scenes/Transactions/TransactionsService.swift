//
//  TransactionsService.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import Foundation

protocol TransactionsServiceLogic {
    func fetch(monthYear: MonthYear, completion: @escaping (Result<TransactionModels.Response, NetworkErrors>) -> Void)
}

final class TransactionsService: TransactionsServiceLogic {
    
    var provider: NetworkProvider<NetworkRequests>
    
    init(provider: NetworkProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(monthYear: MonthYear, completion: @escaping (Result<TransactionModels.Response, NetworkErrors>) -> Void) {
        provider.request(.transactions(monthYear: monthYear), completion: completion)
    }
}
