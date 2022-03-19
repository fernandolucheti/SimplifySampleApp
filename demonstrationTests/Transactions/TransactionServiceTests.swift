//
//  TransactionServiceTests.swift
//  demonstrationTests
//
//  Created by Fernando on 03/01/22.
//

import XCTest
import Moya
@testable import demonstration

class TransactionServiceTests: XCTestCase {
    
    lazy var provider = MoyaProvider<NetworkRequests>(stubClosure: MoyaProvider.immediatelyStub)
    lazy var sut = TransactionsService(provider: provider)
    
    func testFetch() {
        
        sut.fetch { result in
            switch result {
            case .success(let response):
                XCTAssertTrue(response.transactions.first?.value == 13.23)
                XCTAssertTrue(response.transactions.first?.name == "Restaurant")
                XCTAssertTrue(response.transactions.first?.date == "01/01/2021")
                XCTAssertTrue(response.transactions.first?.categoryColor == "#F96766")
            case .failure:
                XCTFail()
            }
        }
    }
}
