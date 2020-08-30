//
//  CatsDetailWorkerMock.swift
//  TheCatsLibraryTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

@testable import TheCatsLibrary

class CatsDetailWorkerMock: CatsDetailWorker {
    var status: ServiceStatus = .success
    override func fetchCatDetails(request: CatsDetail.Request, completion: @escaping completionDataCallback<[CatsDetail.CatDetail]>) {
        switch status {
        case .success:
            if let catDetail: [CatsDetail.CatDetail] = JsonLoader().loadFromJsonFile(mock: .catDetail) {
                completion(.success(catDetail))
            } else {
                completion(.failure(ServiceError.requestFailed))
            }
        default:
            completion(.failure(ServiceError.requestFailed))
        }
    }
}
