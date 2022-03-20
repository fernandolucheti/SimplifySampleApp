//
//  TransactionsFactory.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit
import Moya

final class TransactionsFactory {
    static func createViewController() -> UIViewController {
        let provider = MoyaProvider<NetworkRequests>()
        let service = TransactionsService(provider: provider)
        let presenter = TransactionsPresenter(service: service)
        let viewController = TransactionsViewController(presenter: presenter)
        presenter.setDelegate(viewController)
        return viewController
    }
}
