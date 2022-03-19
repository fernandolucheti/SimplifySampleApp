//
//  BudgetFactory.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Moya

final class BudgetFactory {
    static func createViewController() -> UIViewController {
        let provider = MoyaProvider<NetworkRequests>()
        let service = BudgetService(provider: provider)
        let presenter = BudgetPresenter(service: service)
        let viewController = BudgetViewController(presenter: presenter)
        presenter.setDelegate(viewController)
        return viewController
    }
}
