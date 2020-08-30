//
//  CatsDetailWorker.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

class CatsDetailWorker {
    func fetchCatDetails(request: CatsDetail.Request, completion: @escaping completionDataCallback<[CatsDetail.CatDetail]>) {
        let catsListProvider = CatsDetailProvider(request: request)
        NetworkProvider(route: catsListProvider).fetch(completion: completion)
    }
}
