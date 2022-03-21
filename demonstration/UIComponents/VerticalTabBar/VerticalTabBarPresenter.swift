//
//  VerticalTabBarPresenter.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol VerticalTabBarPresenterDelegate : AnyObject {
    func presentSuccess(viewModel: VerticalTabBarModels.ViewModel)
}

final class VerticalTabBarPresenter {
    private weak var delegate: VerticalTabBarPresenterDelegate?
    private var service: VerticalTabBarServiceLogic
    
    init(service: VerticalTabBarServiceLogic) {
        self.service = service
    }
    
    func setDelegate(_ delegate: VerticalTabBarPresenterDelegate) {
        self.delegate = delegate
    }
    
    func fetch() {
        service.fetch { [weak self] result in
            guard let self = self else { return }
            self.delegate?.presentSuccess(viewModel: self.createViewModel(result))
        }
    }
    
    private func createViewModel(_ response: VerticalTabBarModels.Response) -> VerticalTabBarModels.ViewModel {
        VerticalTabBarModels.ViewModel(categories:
                                        response.categories.compactMap({ category in
            VerticalTabBarModels.CategoryViewModel(color: UIColor(hex: category.color), totalSpent: category.totalSpent)
        }))
    }
}

