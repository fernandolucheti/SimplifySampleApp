//
//  BudgetWorkerTests.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import demonstration
import XCTest
import Moya

class BudgetServiceTests: XCTestCase {
    
    lazy var provider = MoyaProvider<NetworkRequests>(stubClosure: MoyaProvider.immediatelyStub)
    lazy var sut = BudgetService(provider: provider)
    
    func testFetch() {
        
        sut.fetch { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure:
                XCTFail()
            }
        }
    }
}
