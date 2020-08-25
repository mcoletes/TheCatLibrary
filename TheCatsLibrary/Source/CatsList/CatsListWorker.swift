//
//  CatsListWorker.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 24/08/20.
//  Copyright (c) 2020 Mauro Coletes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class CatsListWorker
{
    func fetchCatsList(request: CatsList.Request, completion: @escaping completionDataCallback<CatsList.Response>) {
        let catsListProvider = CatsListProvider(request: request)
        NetworkProvider(route: catsListProvider).fetch(completion: completion)
    }
}
