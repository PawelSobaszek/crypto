//
//  CurrencyDetailsViewModel.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 20/11/2021.
//

import Foundation

protocol CurrencyDetailsViewModelProtocol {
    func fetchCurrencyDetails()
}

final class CurrencyDetailsViewModel: CurrencyDetailsViewModelProtocol {
    private let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func fetchCurrencyDetails() {
        // TODO: Fetch currency details
    }
}
