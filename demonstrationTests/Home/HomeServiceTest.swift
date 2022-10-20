//
//  HomeServiceTest.swift
//  demonstrationTests
//
//  Created by Fernando on 03/01/22.
//

import XCTest
import Moya
@testable import demonstration

class HomeServiceTests: XCTestCase {
    
    lazy var provider = NetworkProvider<NetworkRequests>(stubClosure: MoyaProvider.immediatelyStub)
    lazy var sut = HomeService(provider: provider)
    
    func testFetch() {
        
        sut.fetch { result in
            switch result {
            case .success(let response):
                XCTAssertTrue(response.month == "January")
                XCTAssertTrue(response.balance == 1232.23)
                XCTAssertTrue(response.income == 30000.00)
                XCTAssertTrue(response.expenses == 12300.00)
                XCTAssertTrue(response.monthlyBalance == 17700.00)
            case .failure:
                XCTFail()
            }
        }
    }
}
