//
//  TransactionsPresenter.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

protocol TransactionsPresenterDelegate: AnyObject {
    func presentSuccess(viewModel: TransactionModels.ViewModel)
    func presentError(_ error: NetworkErrors)
}

final class TransactionsPresenter {
    private weak var delegate: TransactionsPresenterDelegate?
    private var service: TransactionsServiceLogic
    
    init(service: TransactionsServiceLogic) {
        self.service = service
    }
    
    func setDelegate(_ delegate: TransactionsPresenterDelegate) {
        self.delegate = delegate
    }
    
    func fetch() {
        service.fetch { [weak self] result in
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
        var viewModelTransactions: [TransactionCellViewModel] = []
        for transaction in response.transactions {
            let viewModelTransaction = TransactionCellViewModel(value: transaction.value,
                                                                name: transaction.name,
                                                                date: transaction.date,
                                                                categoryColor: UIColor(hex: transaction.categoryColor))
            viewModelTransactions.append(viewModelTransaction)
        }
        return TransactionModels.ViewModel(transactions: viewModelTransactions)
    }
}
