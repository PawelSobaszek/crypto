//
//  NetworkService.swift
//  CryptoTelemedi
//
//  Created by Paweł Sobaszek on 22/11/2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ request: DataRequest, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(_ request: DataRequest, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard var urlComponent = URLComponents(string: request.url) else {
            let error = CustomError.invalidEndpoint
            
            return completion(.failure(error.description))
        }
        
        var queryItems: [URLQueryItem] = []
        
        request.queryItems.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            urlComponent.queryItems?.append(urlQueryItem)
            queryItems.append(urlQueryItem)
        }
        
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            let error = CustomError.invalidEndpoint
            
            return completion(.failure(error.description))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        if request.method != .get {
            if let param = request.parameters {
                do {
                    let data = try JSONSerialization.data(withJSONObject: param, options: [])
                    
                    urlRequest.httpBody = data
                } catch {
                    let error = CustomError.encodingParamFailure
                    
                    return completion(.failure(error.description))
                }
            }
        }
        
        urlRequest.allHTTPHeaderFields = request.headers
    
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(CustomError.badStatusCode.description))
            }
            
            guard let data = data else {
                return completion(.failure(CustomError.emptyData.description))
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
