//
//  BudgetPresenter.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BudgetPresenterDelegate: AnyObject {
    func presentSuccess(viewModel: BudgetModels.ViewModel)
    func presentError(_ error: NetworkErrors)
}

final class BudgetPresenter {
    private weak var delegate: BudgetPresenterDelegate?
    private var service: BudgetServiceLogic
    
    init(service: BudgetServiceLogic) {
        self.service = service
    }
    
    func setDelegate(_ delegate: BudgetPresenterDelegate) {
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
    
    private func createViewModel(_ response: BudgetModels.Response) -> BudgetModels.ViewModel {
        BudgetModels.ViewModel(categories: response.categories.compactMap { category in
            BudgetCellViewModel(categoryName: category.name,
                                categoryBudget: category.budget.currencyString(),
                                categoryBudgetRemaining: category.budgetRemaining.currencyString(),
                                totalSpent: category.totalSpent.currencyString(),
                                color: UIColor(hex: category.color),
                                fillPercent: category.budget == 0 ? 100 : Int((category.totalSpent/category.budget)*100))
        })
    }
}
