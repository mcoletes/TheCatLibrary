//
//  CatsListProvider.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 24/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

class CatsListProvider: URLRequestProtocol {
    
    // MARK: - Internal Properties
    
    var request: CatsList.Request
    var httpMethod: HTTPMethod = .get
    
    // MARK: - init
    
    init(request: CatsList.Request) {
        self.request = request
    }
    
    // MARK: - Internal Methods
    
    func urlParameters() -> [URLQueryItem] {
        return  [URLQueryItem(name: "page", value: "\(request.page)"), URLQueryItem(name: "limit", value: "\(request.limit)")]
    }
    
    func path() -> String {
        return "/breeds"
    }
}

