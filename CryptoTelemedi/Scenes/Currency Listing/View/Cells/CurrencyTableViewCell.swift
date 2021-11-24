//
//  CurrencyTableViewCell.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 22/11/2021.
//

import UIKit

final class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var symbol: UILabel!
    
    static let identifier = "currencyTableViewCell"
    
    func configure(currency: Currency) {
        name.text = currency.name
        symbol.text = currency.symbol
    }
}
