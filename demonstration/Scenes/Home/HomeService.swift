//
//  HomeService.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

protocol HomeServiceLogic: AnyObject {
    func fetch(completion: @escaping (Result<HomeModels.Response, NetworkErrors>) -> Void)
}

final class HomeService: HomeServiceLogic {
    
    var provider: NetworkProvider<NetworkRequests>
    
    init(provider: NetworkProvider<NetworkRequests>) {
        self.provider = provider
    }
    
    func fetch(completion: @escaping (Result<HomeModels.Response, NetworkErrors>) -> Void) {
        provider.request(.home, completion: completion)
    }
}

