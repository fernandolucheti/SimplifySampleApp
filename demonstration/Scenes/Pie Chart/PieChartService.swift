//
//  PieChartService.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol PieChartServiceLogic {
    func fetch(monthYear: MonthYear, completion: @escaping (Result<PieChartModels.Response, NetworkErrors>) -> Void)
}

class PieChartService: PieChartServiceLogic {
    
    var provider: NetworkProvider<NetworkRequests>
    
    init(provider: NetworkProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(monthYear: MonthYear, completion: @escaping (Result<PieChartModels.Response, NetworkErrors>) -> Void) {
        provider.request(.pieChart(monthYear: monthYear), completion: completion)
    }
}
