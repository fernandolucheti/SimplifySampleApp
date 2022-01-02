//
//  HomePresenter.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import Foundation

protocol HomePresenterDelegate: AnyObject {
    func presentSuccess(viewModel: HomeModels.ViewModel)
    func presentError()
}

final class HomePresenter {
    private weak var delegate: HomePresenterDelegate?
    private var service: HomeServiceLogic
    
    init(service: HomeServiceLogic) {
        self.service = service
    }
    
    func setDelegate(_ delegate: HomePresenterDelegate) {
        self.delegate = delegate
    }
    
    func fetch() {
        service.fetch { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.delegate?.presentSuccess(viewModel: self.createViewModel(response))
            case .failure:
                self.delegate?.presentError()
            }
        }
    }
    
    private func createViewModel(_ response: HomeModels.Response) -> HomeModels.ViewModel {
        HomeModels.ViewModel(month: response.month,
                             balance: response.balance.currencyString(),
                             income: response.income.currencyString(),
                             expenses: response.expenses.currencyString(),
                             monthlyBalance: response.monthlyBalance.currencyString())
    }
}
