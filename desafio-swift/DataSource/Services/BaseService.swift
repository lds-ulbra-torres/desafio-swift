//
//  BaseService.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

class BaseService {
    
    func callGet<T: Decodable>(
                    serviceUrl: String,
                    parameters: [String: String]?,
                    headers: [String: String]?,
                    completionHandler: @escaping (_ responseObject: T?, _ error: ServiceRequestError) -> Void) {
        makeRequest(method: "GET", serviceUrl: serviceUrl, parameters: parameters, headers: headers, completionHandler: completionHandler)
    }
    
    private func makeRequest<T: Decodable>(
                                method: String,
                                serviceUrl: String,
                                parameters: [String: String]?,
                                headers: [String: String]?,
                                completionHandler: @escaping (_ responseObject: T?, _ error: ServiceRequestError) -> Void) {
        guard let url = URL(string: serviceUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    completionHandler(nil, .error(error?.localizedDescription ?? "Error"))
                    return
                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    guard let data = data else {
                        completionHandler(nil, .error("Data is nil!"))
                        return
                    }
                    
                    let decode = try decoder.decode(T.self, from: data)
                    completionHandler(decode, .none("Success"))
                } catch let err {
                    completionHandler(nil, .error(err.localizedDescription))
                }
            }
        }
        task.resume()
    }
}
