//
//  CustomErrors.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 23/11/2021.
//

import Foundation

enum CustomError {
    case invalidEndpoint
    case encodingParamFailure
    case badStatusCode
    case emptyData
    
    var description: NSError {
        switch self {
        case .invalidEndpoint:
            return NSError(domain: "Invalid endpoint", code: 404, userInfo: [NSLocalizedDescriptionKey : "Przepraszamy, pracujemy nad rozwiązaniem tego błędu"])
        case .encodingParamFailure:
            return NSError(domain: "Encoding param failure", code: 600, userInfo: [NSLocalizedDescriptionKey : "Przepraszamy, pracujemy nad rozwiązaniem tego błędu"])
        case .badStatusCode:
            return NSError(domain: "Bad response status code", code: 700, userInfo: [NSLocalizedDescriptionKey : "Przepraszamy, pracujemy nad rozwiązaniem tego błędu"])
        case .emptyData:
            return NSError(domain: "Empty data", code: 800, userInfo: [NSLocalizedDescriptionKey : "Przepraszamy, pracujemy nad rozwiązaniem tego błędu"])
        }
    }
}
