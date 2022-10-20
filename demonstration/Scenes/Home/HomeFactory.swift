//
//  HomeFactory.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import UIKit

final class HomeFactory {
    static func createViewController() -> UIViewController {
        let provider = NetworkProvider<NetworkRequests>()
        let service = HomeService(provider: provider)
        let presenter = HomePresenter(service: service)
        let viewController = HomeViewController(presenter: presenter)
        presenter.setDelegate(viewController)
        return viewController
    }
}
