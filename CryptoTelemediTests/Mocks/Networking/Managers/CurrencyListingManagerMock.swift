//
//  CurrencyListingManagerMock.swift
//  CryptoTelemediTests
//
//  Created by Paweł Sobaszek on 25/11/2021.
//

import Foundation
@testable import CryptoTelemedi

final class CurrencyListingManagerMock: CurrencyListingManagerProtocol {
    private let mockCurrencyList: [Currency] = [Currency(id: 3, name: "a", symbol: "b"),
                                                Currency(id: 5, name: "c", symbol: "d")]
    
    func getCurrencyList(completion: @escaping (Result<[Currency], Error>) -> Void) {
        completion(.success(mockCurrencyList))
    }
}
