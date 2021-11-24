//
//  Currency.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 23/11/2021.
//

import Foundation

struct Currency {
    let id: Int
    let name: String
    let symbol: String
    
    init(id: Int,
         name: String,
         symbol: String) {
        self.id = id
        self.name = name
        self.symbol = symbol
    }
}
