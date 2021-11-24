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

final class CurrencyListingCoordinator: Coordinator, CurrencyListingCoordinatorDelegate {
    func openCurrencyDetails(id: Int) {
        let viewController = CurrencyDetailsViewController()
        let viewModel = CurrencyDetailsViewModel(id: id)
        viewController.viewModel = viewModel
        
        let coordinator = CurrencyListingCoordinator(viewController: viewController, supercoordinator: self)
        
        start(coordinator: coordinator, presentationStyle: .push, animated: true)
    }
}
