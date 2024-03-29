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
    
    lazy var provider = NetworkProvider<NetworkRequests>(stubClosure: MoyaProvider.immediatelyStub)
    lazy var sut = TransactionsService(provider: provider)
    
    func testFetch() {
        
        sut.fetch(monthYear: MonthYear(month: 4, year: 2022)) { result in
            switch result {
            case .success(let response):
                XCTAssertTrue(response.transactions.first?.value == -13.23)
                XCTAssertTrue(response.transactions.first?.name == "Restaurant")
                XCTAssertTrue(response.transactions.first?.date == "01/01/2021")
                XCTAssertTrue(response.transactions.first?.categoryColor == "#A00014")
            case .failure:
                XCTFail()
            }
        }
    }
}
