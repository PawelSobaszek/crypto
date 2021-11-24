//
//  BasicNetworkData.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 23/11/2021.
//

import Foundation

final class BasicNetworkData {
    static let apiKey: String = "PASTE_YOUR_API_KEY_HERE"
    
    private static let baseURL: String = "https://pro-api.coinmarketcap.com/"
    
    private static let apiVersion: String = "v1/"
    
    static func getRequestURL(path: String) -> String {
        baseURL + apiVersion + path
    }
}
