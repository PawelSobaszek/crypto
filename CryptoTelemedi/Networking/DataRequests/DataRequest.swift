//
//  DataRequest.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 22/11/2021.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum EndpointCategory: String {
    case cryptocurrency = "cryptocurrency/"
}

public typealias Parameters = [String : Any]

protocol DataRequest {
    var url: String { get }
    var method: HTTPMethod { get }
    var endpointCategory: EndpointCategory { get }
    var headers: [String : String] { get }
    var queryItems: [String : String] { get }
    var parameters: Parameters? { get }
}

extension DataRequest {
    var headers: [String : String] {
        ["X-CMC_PRO_API_KEY": BasicNetworkData.apiKey]
    }
    
    var queryItems: [String : String] {
        [:]
    }
    
    var parameters: Parameters? {
        nil
    }
}
