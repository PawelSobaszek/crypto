//
//  CurrencyListingViewModelTests.swift
//  CryptoTelemediTests
//
//  Created by Paweł Sobaszek on 25/11/2021.
//

import XCTest
@testable import CryptoTelemedi

class CurrencyListingViewModelTests: XCTestCase {

    private var currencyListingVM: CurrencyListingViewModelProtocol?
    
    private let searchVariantOne: String = "a"
    private let searchVariantTwo: String = "C"
    private let searchVariantThree: String = "e"
    
    private let indexPathOne: IndexPath = IndexPath(item: 0, section: 0)
    private let indexPathTwo: IndexPath = IndexPath(item: 1, section: 0)
    private let indexPathThree: IndexPath = IndexPath(item: 2, section: 0)
    
    override func setUpWithError() throws {
        currencyListingVM = CurrencyListingViewModel(manager: CurrencyListingManagerMock())
    }

    override func tearDownWithError() throws {
        currencyListingVM = nil
    }

    func test_fetchCurrency_isNotEmpty() {
        currencyListingVM!.fetchCurrency()
        
        let result = currencyListingVM!.currency
        XCTAssertFalse(result.isEmpty)
    }
    
    func test_currency_twoResults() {
        currencyListingVM!.fetchCurrency()
        
        let result = currencyListingVM!.currency
        XCTAssertEqual(result.count, 2)
        let firstResult = result.first!
        XCTAssertEqual(firstResult.id, 3)
        XCTAssertEqual(firstResult.name, "a")
        XCTAssertEqual(firstResult.symbol, "b")
        let lastResult = result.last!
        XCTAssertEqual(lastResult.id, 5)
        XCTAssertEqual(lastResult.name, "c")
        XCTAssertEqual(lastResult.symbol, "d")
    }
    
    func test_searchCurrency_variantOne_oneResult() {
        currencyListingVM!.fetchCurrency()
        
        currencyListingVM!.searchCurrency(searchText: searchVariantOne)
        let result = currencyListingVM!.currency
        XCTAssertFalse(result.isEmpty)
        XCTAssertEqual(result.count, 1)
        let resultFirst = result.first!
        XCTAssertEqual(resultFirst.id, 3)
        XCTAssertEqual(resultFirst.name, "a")
        XCTAssertEqual(resultFirst.symbol, "b")
    }
    
    func test_searchCurrency_variantTwo_oneResult() {
        currencyListingVM!.fetchCurrency()
        
        currencyListingVM!.searchCurrency(searchText: searchVariantTwo)
        let result = currencyListingVM!.currency
        XCTAssertFalse(result.isEmpty)
        XCTAssertEqual(result.count, 1)
        let resultFirst = result.first!
        XCTAssertEqual(resultFirst.id, 5)
        XCTAssertEqual(resultFirst.name, "c")
        XCTAssertEqual(resultFirst.symbol, "d")
    }
    
    func test_searchCurrency_variantThree_resultIsEmpty() {
        currencyListingVM!.fetchCurrency()
        
        currencyListingVM!.searchCurrency(searchText: searchVariantThree)
        let result = currencyListingVM!.currency
        XCTAssertTrue(result.isEmpty)
    }
    
    func test_searchCurrency_getCurrencyId_indexPathOne() {
        currencyListingVM!.fetchCurrency()
        
        let result = currencyListingVM!.getCurrencyId(indexPath: indexPathOne)
        XCTAssertEqual(result, 3)
    }
    
    func test_searchCurrency_getCurrencyId_indexPathTwo() {
        currencyListingVM!.fetchCurrency()
        
        let result = currencyListingVM!.getCurrencyId(indexPath: indexPathTwo)
        XCTAssertEqual(result, 5)
    }
    
    func test_searchCurrency_getCurrencyId_indexPathThree() {
        currencyListingVM!.fetchCurrency()
        
        let result = currencyListingVM!.getCurrencyId(indexPath: indexPathThree)
        XCTAssertEqual(result, 0)
    }
}
