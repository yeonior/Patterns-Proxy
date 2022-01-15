//
//  LoadService.swift
//  Patterns-Proxy
//
//  Created by Ruslan on 15.01.2022.
//

import Foundation

class LoadService: LoadServiceProtocol {
    
    func loadPhoto(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        let session = URLSession(configuration: config)
        session.dataTask(with: url, completionHandler: completion).resume()
    }
}
