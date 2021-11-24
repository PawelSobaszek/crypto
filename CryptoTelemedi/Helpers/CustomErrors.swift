//
//  CustomErrors.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 23/11/2021.
//

import Foundation

enum CustomError: Error {
    case invalidEndpoint
    case encodingParamFailure
    
    var description: NSError {
        switch self {
        case .invalidEndpoint:
            return NSError(domain: "Invalid endpoint", code: 404, userInfo: nil)
        case .encodingParamFailure:
            return NSError(domain: "Encoding param failure", code: 600, userInfo: nil)
        }
    }
}
