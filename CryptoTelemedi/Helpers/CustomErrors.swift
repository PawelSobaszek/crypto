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
            return NSError(domain: Strings.errorCustomErrorInvalidEndpoint(), code: 404, userInfo: [NSLocalizedDescriptionKey : Strings.errorCustomErrorGeneralUserInfo()])
        case .encodingParamFailure:
            return NSError(domain: Strings.errorCustomErrorEncodingParamFailure(), code: 600, userInfo: [NSLocalizedDescriptionKey : Strings.errorCustomErrorGeneralUserInfo()])
        case .badStatusCode:
            return NSError(domain: Strings.errorCustomErrorBadStatusCode(), code: 700, userInfo: [NSLocalizedDescriptionKey : Strings.errorCustomErrorGeneralUserInfo()])
        case .emptyData:
            return NSError(domain: Strings.errorCustomErrorEmptyData(), code: 800, userInfo: [NSLocalizedDescriptionKey : Strings.errorCustomErrorGeneralUserInfo()])
        }
    }
}
