//
//  CatsDetailViewModel.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation
import Combine

protocol CatsDetailViewModelProtocol {
    var catState: Bindable<CatsDetail.ViewState?> { get set }
    var state: Bindable<Status> { get set }
    var title: Bindable<String> { get set }
    func initializer()
    func fetchCatDetails()
}

class CatsDetailViewModel: CatsDetailViewModelProtocol {
    
    // MARK: - Internal Properties
    
    var catState: Bindable<CatsDetail.ViewState?>
    var title: Bindable<String> = Bindable<String>("")
    var state: Bindable<Status> = Bindable<Status>(.none)
    
    // MARK: - Private Properties
    
    private var cat: Cat
    
    // MARK: - Init
    
    init(cat: Cat) {
        self.cat = cat
        catState = Bindable<CatsDetail.ViewState?>(nil)
    }
    
    // MARK: - Internal Methods
    
    func initializer() {
        title.value = cat.name
        catState.value = CatsDetail.ViewState(cat: self.cat)
    }
    
    func fetchCatDetails() {
        
        fetchCatDetails(request: CatsDetail.Request(id: cat.id)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let catDetail):
                self.state.value = .success
                guard let href = catDetail.first?.url else { return }
                self.catState.value = CatsDetail.ViewState(cat: self.cat, href: href)
            case .failure(let error):
                self.state.value = .error(error: Text.catsDetailErrorMessage.value)
                print(error)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func fetchCatDetails(request: CatsDetail.Request, completion: @escaping completionDataCallback<[CatsDetail.CatDetail]>) {
        let catsListProvider = CatsDetailProvider(request: request)
        NetworkProvider(route: catsListProvider).fetch(completion: completion)
    }
}


