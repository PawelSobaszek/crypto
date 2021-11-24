//
//  CurrencyDetailsCoordinator.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 20/11/2021.
//

import Foundation

final class CurrencyDetailsCoordinator: BaseCoordinator {
    private var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    override func start() {
        let currencyDetailsViewController = CurrencyDetailsViewController()
        let currencyDetailsViewModel = CurrencyDetailsViewModel(id: id)
        currencyDetailsViewController.viewModel = currencyDetailsViewModel
        
        navigationController.pushViewController(currencyDetailsViewController, animated: true)
    }
}

