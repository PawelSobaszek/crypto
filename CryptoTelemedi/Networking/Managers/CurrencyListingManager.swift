//
//  CurrencyListingNetworkService.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 22/11/2021.
//

import Foundation

protocol CurrencyListingManagerProtocol {
    func getCurrencyList(completion: @escaping (Result<[Currency], Error>) -> Void)
}

final class CurrencyListingManager: CurrencyListingManagerProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getCurrencyList(completion: @escaping (Result<[Currency], Error>) -> Void) {
        let request = CurrencyListingRequest.listingLatest
        self.networkService.request(request, expecting: CryptocurrencyListingsResponse.self) { result in
            switch result {
            case .success(let response):
                let currencyList = response.data.map { Currency(id: $0.id, name: $0.name, symbol: $0.symbol) }
                completion(.success(currencyList))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
}
