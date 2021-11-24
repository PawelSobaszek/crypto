//
//  CurrencyDetailsViewController.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 22/11/2021.
//

import UIKit

protocol CurrencyDetailsViewControllerDelegate {
    func setupView()
}

final class CurrencyDetailsViewController: UIViewController, CurrencyDetailsViewControllerDelegate {
    var viewModel: CurrencyDetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.fetchCurrencyDetails()
    }
}

extension CurrencyDetailsViewController {
    func setupView() {
        // TODO: Setup view elements
    }
}
