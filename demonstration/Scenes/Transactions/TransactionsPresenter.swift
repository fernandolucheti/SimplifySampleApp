//
//  TransactionsPresenter.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import Foundation

protocol TransactionsPresenterDelegate: AnyObject {
    func presentSuccess(viewModel: TransactionModels.ViewModel)
    func presentError(_ error: NetworkErrors)
}

final class TransactionsPresenter {
    private weak var delegate: TransactionsPresenterDelegate?
    private var service: TransactionsServiceLogic
    
    var transactions: [TransactionCellViewModel] = []
    
    init(service: TransactionsServiceLogic) {
        self.service = service
    }
    
    func setDelegate(_ delegate: TransactionsPresenterDelegate) {
        self.delegate = delegate
    }
    
    func fetch(monthYear: MonthYear) {
        service.fetch(monthYear: monthYear) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.delegate?.presentSuccess(viewModel: self.createViewModel(response))
            case .failure(let error):
                self.delegate?.presentError(error)
            }
        }
    }
    
    private func createViewModel(_ response: TransactionModels.Response) -> TransactionModels.ViewModel {
        transactions = response.transactions.compactMap { transaction in
            TransactionCellViewModel(value: transaction.value,
                                     name: transaction.name,
                                     date: transaction.date,
                                     categoryColor: transaction.categoryColor)
        }
        return TransactionModels.ViewModel(transactions: transactions)
    }
}
