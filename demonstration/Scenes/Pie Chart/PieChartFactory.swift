//
//  PieChartFactory.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class PieChartFactory {
    static func createViewController() -> UIViewController {
        let provider = NetworkProvider<NetworkRequests>()
        let service = PieChartService(provider: provider)
        let presenter = PieChartPresenter(service: service)
        let viewController = PieChartViewController(presenter: presenter)
        presenter.setDelegate(viewController)
        return viewController
    }
}
