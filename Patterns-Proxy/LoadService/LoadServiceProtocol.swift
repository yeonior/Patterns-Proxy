//
//  LoadServiceProtocol.swift
//  Patterns-Proxy
//
//  Created by Ruslan on 15.01.2022.
//

import Foundation

protocol LoadServiceProtocol {
    func loadPhoto(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
