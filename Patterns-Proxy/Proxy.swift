//
//  Proxy.swift
//  Patterns-Proxy
//
//  Created by Ruslan on 15.01.2022.
//

import Foundation

var cacheData: Data?

class Proxy: LoadServiceProtocol {
    
    private let service: LoadServiceProtocol
    
    init(service: LoadServiceProtocol) {
        self.service = service
    }
    
    func loadPhoto(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        if cacheData == nil {
            service.loadPhoto(url: url, completion: { data, response, error in
                cacheData = data
                completion(data, response, error)
            })
        } else {
            completion(cacheData, nil, nil)
        }
    }
}
