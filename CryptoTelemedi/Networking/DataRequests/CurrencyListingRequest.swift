//
//  CurrencyListingRequest.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 23/11/2021.
//

import Foundation

enum CurrencyListingRequest: DataRequest {
    case listingLatest
    
    var endpointCategory: EndpointCategory {
        .cryptocurrency
    }
     
    var url: String {
        return BasicNetworkData.getRequestURL(path: endpointCategory.rawValue + "listings/latest")
    }
    
    var method: HTTPMethod {
        .get
    }
}
