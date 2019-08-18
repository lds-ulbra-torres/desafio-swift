//
//  ServiceRequestError.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

enum ServiceRequestError {
    case none(String)
    case parseError(String)
    case unauthorized(String)
    case notFound(String)
    case noConnection(String)
    case error(String)
    case badRequest(String)
}
