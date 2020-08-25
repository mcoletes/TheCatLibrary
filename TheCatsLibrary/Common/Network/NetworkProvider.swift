//
//  NetworkProvider.swift
//  TopRatedRepositories
//
//  Created by Mauro Sasso Coletes on 11/04/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

typealias completionDataCallback<T: Decodable> = ((Result<T, ServiceError>)-> Void)

class NetworkProvider {
    
    // MARK: - Properties
    
    var route: URLRequestProtocol
    
    private let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30
        
        return config
    }()
    
    // MARK: - Init
    
    init(route: URLRequestProtocol) {
        self.route = route
    }
    
    func fetch<T: Decodable>(completion: @escaping completionDataCallback<T>) -> URLSessionDataTask {
        let request = route.asURLRequest()
                Logger.logRequest(request: request)
               let session = URLSession(configuration: configuration).dataTask(with: request) { data, response, error in
                   self.handleDecodableResponse(data: data, response: response, error: error, completion: completion)
               }
               session.resume()
               
               return session
    }
    
    func handleDecodableResponse<T: Decodable>(data: Data?,
                                               response: URLResponse?,
                                               error: Error?,
                                               completion: completionDataCallback<T>) {
        Logger.logResponse(response, data)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            completion(.failure(ServiceError.requestFailed))
            return
        }
        
        guard isSucess(statusCode) else {
            completion(.failure(ServiceError.responseUnsuccessful(statusCode: statusCode)))
            return
        }
        
        if let data = data {
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(Result.success(model))
                return
            }
            catch {
                 completion(.failure(ServiceError.jsonParsingFailure))
                return
            }
        }
    }
    
    private func isSucess(_ statusCode: Int) -> Bool {
        return 200..<300 ~= statusCode
    }
}
