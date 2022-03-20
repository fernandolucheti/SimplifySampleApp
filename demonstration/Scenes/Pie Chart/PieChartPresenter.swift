//
//  PieChartPresenter.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PieChartPresenterDelegate : AnyObject {
    func presentSuccess(viewModel: PieChartModels.ViewModel)
    func presentError(_ error: NetworkErrors)
}

final class PieChartPresenter {
    private weak var delegate: PieChartPresenterDelegate?
    private var service: PieChartServiceLogic
    
    init(service: PieChartServiceLogic) {
        self.service = service
    }
    
    func setDelegate(_ delegate: PieChartPresenterDelegate) {
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
    
    private func createViewModel(_ response: PieChartModels.Response) -> PieChartModels.ViewModel {
        PieChartModels.ViewModel(categories:
                                    response.categories.compactMap { category in
                                        PieChartModels.CategoryViewModel(name: category.name,
                                                                         color: UIColor(hex: category.color),
                                                                         totalSpent: category.totalSpent)
                                    })
    }
}
