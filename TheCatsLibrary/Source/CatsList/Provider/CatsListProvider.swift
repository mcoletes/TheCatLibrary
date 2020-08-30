//
//  CatsListProvider.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 24/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

class CatsListProvider: URLRequestProtocol {
    
    var request: CatsList.Request
    
    var httpMethod: HTTPMethod = .get

    init(request: CatsList.Request) {
        self.request = request
    }
    
    func urlParameters() -> [URLQueryItem] {
        return  [URLQueryItem(name: "page", value: "\(request.page)"), URLQueryItem(name: "limit", value: "\(request.limit)")]
    }
    
    func path() -> String {
        return "/breeds"
    }
}

