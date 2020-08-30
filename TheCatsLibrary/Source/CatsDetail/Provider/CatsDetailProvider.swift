//
//  CatsDetailProvider.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

class CatsDetailProvider: URLRequestProtocol {
    
    var request: CatsDetail.Request
    
    var httpMethod: HTTPMethod = .get

    init(request: CatsDetail.Request) {
        self.request = request
    }
    
    func urlParameters() -> [URLQueryItem] {
        return  [URLQueryItem(name: "breed_id", value: "\(request.id)")]
    }
    
    func path() -> String {
        return "/images/search"
    }
}
