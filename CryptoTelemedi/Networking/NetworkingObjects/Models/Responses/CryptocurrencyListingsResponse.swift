//
//  DataResponse.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 23/11/2021.
//

import Foundation

struct CryptocurrencyListingsResponse: Decodable {
    var data: [CurrencyResponse]
}
