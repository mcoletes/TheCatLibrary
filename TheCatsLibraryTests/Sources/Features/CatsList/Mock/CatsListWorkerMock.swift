//
//  CatsListWorkerMock.swift
//  TheCatsLibraryTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

@testable import TheCatsLibrary

class CatsListWorkerMock: CatsListWorker {
    var status: ServiceStatus = .success
    var isLastPage: Bool = false
    override func fetchCatsList(request: CatsList.Request, completion: @escaping completionDataCallback<[Cat]>) {
        switch status {
        case .success:
            if let catsList: [Cat] = JsonLoader().loadFromJsonFile(jsonFileName: "CatsList"), !isLastPage {
                completion(.success(catsList))
            } else {
                 completion(.success([]))
            }
        default:
            completion(.failure(ServiceError.requestFailed))
        }
    }
}
