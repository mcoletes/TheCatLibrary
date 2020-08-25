//
//  CatsListInteractor.swift
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

protocol CatsListBusinessLogic {
    func getListOfCats()
}

protocol CatsListDataStore {
}

class CatsListInteractor: CatsListBusinessLogic, CatsListDataStore {
    
     // MARK: Properties
    var presenter: CatsListPresentationLogic?
    var worker: CatsListWorker
    
    var currentPage: Int = 0
    var pageSize: Int = 30
    
     // MARK: Initializer
    
    init(worker: CatsListWorker = CatsListWorker()) {
        self.worker = worker
    }
    
    func getListOfCats() {
        worker.fetchCatsList(request: CatsList.Request(page: currentPage, limit: pageSize)) { (result) in
            switch result {
            case .success(let response):
                self.presenter?.stopAnimating()
                print(response)
            case .failure(let error):
                 print(error)
            }
        }
    }
}