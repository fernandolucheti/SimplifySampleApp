//
//  HomeFactory.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit
import Moya

final class HomeFactory {
    static func createViewController() -> UIViewController {
        let provider = MoyaProvider<NetworkRequests>()
        let service = HomeService(provider: provider)
        let presenter = HomePresenter(service: service)
        let viewController = HomeViewController(presenter: presenter)
        presenter.setDelegate(viewController)
        return viewController
    }
}
