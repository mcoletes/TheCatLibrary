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
    func fetchListOfCats()
    func loadNextPageIfNeeded(for index: Int)
    func didSelectCat(for index: Int)
}

protocol CatsListDataStore {
    var cat: Cat? { get set }
}

class CatsListInteractor: CatsListBusinessLogic, CatsListDataStore {
    
    // MARK: - Properties
    
    var presenter: CatsListPresentationLogic?
    var availableCats: [Cat] = []
    var cat: Cat?
    
    // MARK: - Private Properties
    
    private var worker: CatsListWorker
    private var currentPage: Int = 0
    private var pageSize: Int = 20
    private var kItemsToBeConsideredForPrefetch: Int = 1
    
    // MARK: Initializer
    
    init(worker: CatsListWorker = CatsListWorker()) {
        self.worker = worker
    }
    
    // MARK: - Internal Methods
    
    func fetchListOfCats() {
        self.presenter?.presentLoading()
        worker.fetchCatsList(request: CatsList.Request(page: currentPage, limit: pageSize)) { [weak self] (result) in
            switch result {
            case .success(let cats):
                self?.availableCats.append(contentsOf: cats)
                if let pageSize = self?.pageSize, cats.count < pageSize {
                    self?.presenter?.presentCats(cats: cats, isLastPage: true)
                    self?.presenter?.stopLoading()
                } else {
                    self?.presenter?.presentCats(cats: cats, isLastPage: false)
                }
                
            case .failure(_):
                self?.presenter?.presentError(action: self?.fetchListOfCats)
            }
        }
    }
    
    func loadNextPageIfNeeded(for index: Int) {
        let targetCount = (currentPage + 1) * pageSize - kItemsToBeConsideredForPrefetch
        guard index == targetCount else {
            return
        }
        currentPage += 1
        fetchListOfCats()
    }
    
    func didSelectCat(for index: Int) {
        guard availableCats.count > index else { return }
        cat = availableCats[index]
        presenter?.presentCatDetail()
    }
}
