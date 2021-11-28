//
//  CurrencyListingViewModel.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 20/11/2021.
//

import Foundation

protocol CurrencyListingViewModelProtocol: AnyObject {
    var currency: [Currency] { get }
    
    func fetchCurrency()
    func searchCurrency(searchText: String)
    func getCurrencyId(indexPath: IndexPath) -> Int
}

final class CurrencyListingViewModel: CurrencyListingViewModelProtocol {
    var currency: [Currency] = []
    var currencyFullList: [Currency] = []
    
    weak var delegate: CurrencyListingViewControllerDelegate?
    
    private let manager: CurrencyListingManagerProtocol
    
    init(manager: CurrencyListingManagerProtocol) {
        self.manager = manager
    }
    
    func fetchCurrency() {
        self.delegate?.setLoadingState(isLoading: true)
        manager.getCurrencyList { [weak self] result in
            guard let self = self else { return }
            self.delegate?.setLoadingState(isLoading: false)
            switch result {
            case .success(let response):
                self.currency = response
                self.currencyFullList = response
                self.delegate?.reloadTable()
            case .failure(let error):
                self.delegate?.tryAgainAlert(title: Strings.errorGeneralTitle(), message: error.localizedDescription, tryAgainOption: {
                    self.fetchCurrency()
                })
            }
        }
    }
    
    func searchCurrency(searchText: String) {
        self.currency = searchText == "" ? currencyFullList : filtrCurrencyList(searchText: searchText.lowercased())
        delegate?.reloadTable()
    }
    
    func getCurrencyId(indexPath: IndexPath) -> Int {
        guard let currency = currency[safe: indexPath.row] else { return 0 }
        return currency.id
    }
    
    private func filtrCurrencyList(searchText: String) -> [Currency] {
        let ret = currencyFullList.filter({ (currency: Currency) -> Bool in
            currency.name.lowercased().contains(searchText) || currency.symbol.lowercased().contains(searchText)
        })
        return ret
    }
}
