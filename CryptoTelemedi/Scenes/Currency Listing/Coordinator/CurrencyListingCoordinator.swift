//
//  CurrencyListingCoordinator.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 20/11/2021.
//

import Foundation
import UIKit

protocol CurrencyListingCoordinatorDelegate {
    func openCurrencyDetails(id: Int)
}

final class CurrencyListingCoordinator: BaseCoordinator, CurrencyListingCoordinatorDelegate {
    override func start() {
        let currencyListingViewController = CurrencyListingViewController()
        currencyListingViewController.coordinator = self
        let currencyListingViewModel = CurrencyListingViewModel(manager: CurrencyListingManager())
        currencyListingViewController.viewModel = currencyListingViewModel
        currencyListingViewModel.delegate = currencyListingViewController
        
        navigationController.setViewControllers([currencyListingViewController], animated: false)
    }
}

extension CurrencyListingCoordinator {
    func openCurrencyDetails(id: Int) {
        let coordinator = CurrencyDetailsCoordinator(id: id)
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)
    }
}
