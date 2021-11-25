//
//  CurrencyResponse.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 23/11/2021.
//

import Foundation

struct CurrencyResponse: Decodable {
    var id: Int
    var name: String
    var symbol: String
}
