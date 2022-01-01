//
//  ViewController.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit
import Moya

class HomeViewController: UIViewController {
    let provider = MoyaProvider<NetworkRequests>()
    
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
        provider.request(.home) { result in
            switch result {
            case.success(let response):
                print(response)
                do {
                    let responseModel = try response.map(HomeModels.Response.self)
                    print(responseModel)
                } catch {
                    print("error")
                }
            case .failure(let error):
                 print(error)
            }
        }
    }


}

