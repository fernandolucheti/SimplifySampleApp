//
//  HomeBudgetBarPresenter.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//


protocol HomeBudgetBarPresenterDelegate : AnyObject {
    func presentSuccess(viewModel: HomeBudgetBarModels.ViewModel)
}

final class HomeBudgetBarPresenter {
    private typealias Models = HomeBudgetBarModels
    private weak var delegate: HomeBudgetBarPresenterDelegate?
    private var service: HomeBudgetBarServiceLogic
    
    init(service: HomeBudgetBarServiceLogic) {
        self.service = service
    }
    
    func setDelegate(_ delegate: HomeBudgetBarPresenterDelegate) {
        self.delegate = delegate
    }
    
    func fetch() {
        service.fetch { [weak self] result in
            guard let self = self else { return }
            self.delegate?.presentSuccess(viewModel: self.createViewModel(result))
        }
    }
    
    private func createViewModel(_ response: Models.Response) -> Models.ViewModel {
        Models.ViewModel(categories: response.categories.compactMap({ category in
            Models.CategoryViewModel(color: category.color, totalSpent: category.totalSpent)
        }))
    }
}

