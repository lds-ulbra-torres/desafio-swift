//
//  PersonService.swift
//  desafio-swift
//
//  Created by Arthur Rocha on 17/08/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

protocol PersonServiceProtocol {
    func fetchAll(completionHandler: @escaping (PersonResponse?, _ error: ServiceRequestError) -> Void)
    func fetchId(person: Person, completionHandler: @escaping (Person?, _ error: ServiceRequestError) -> Void)
}

class PersonService: BaseService {
    func fetchAll(completionHandler: @escaping (PersonResponse?, ServiceRequestError) -> Void) {
        let endpoint = baseURL + "/people"
        callGet(serviceUrl: endpoint, parameters: nil, headers: nil, completionHandler: completionHandler)
    }
    
    func fetchId(person: Person, completionHandler: @escaping (Person?, ServiceRequestError) -> Void) {
        let endpoint = person.url
        callGet(serviceUrl: endpoint, parameters: nil, headers: nil, completionHandler: completionHandler)
    }
}

extension PersonService: PersonServiceProtocol {}
