//
//  CatsListPresenter.swift
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

protocol CatsListPresentationLogic {
    func presentLoading()
    func stopLoading()
    func presentCats(cats: [Cat], isLastPage: Bool)
    func presentCatDetail()
}

class CatsListPresenter: CatsListPresentationLogic {
    
    // MARK: - Internal Properties
    
    weak var viewController: CatsListDisplayLogic?
    
    // MARK: - Internal Methods
    
    func presentLoading() {
        viewController?.startLoading()
    }
    
    func stopLoading() {
        viewController?.stopLoading()
    }
    
    func presentCats(cats: [Cat], isLastPage: Bool) {
        var catsList = cats.map({ CatsList.CatVM(name: $0.name, description: $0.description, color: CatsList.Color.blue) })
        
        if isLastPage {
            catsList.append(CatsList.CatVM(name: Text.catsListLastCatTitle.value, description: Text.catsListLastCatDescription.value, color: CatsList.Color.black))
        }
        
        viewController?.showCats(cats: catsList)
    }
    
    func presentCatDetail() {
        viewController?.showCatDetail()
    }
}
