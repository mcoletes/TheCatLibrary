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
    var cat: Cat { get set }
    var catState: Bindable<CatsDetail.ViewState?> { get set }
    var state: Bindable<ViewStates> { get set }
    var title: Bindable<String> { get set }
    func fetchCatDetails()
}

class CatsDetailViewModel: CatsDetailViewModelProtocol {
    var catState: Bindable<CatsDetail.ViewState?>
    var title: Bindable<String> = Bindable<String>("")
    var state: Bindable<ViewStates> = Bindable<ViewStates>(.loading)
    var cat: Cat
    
    init(cat: Cat) {
        self.cat = cat
        catState = Bindable<CatsDetail.ViewState?>(nil)
    }
    
    func fetchCatDetails() {
        title.value = cat.name
        state.value = .loading
        fetchCatDetails(request: CatsDetail.Request(id: cat.id)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let catDetail):
                self.state.value = .success
                guard let url = catDetail.first?.url else { return }
                self.catState.value = CatsDetail.ViewState(cat: self.cat, url: url)
            case .failure(let error):
                self.state.value = .error(error: "errooooo")
                print(error)
            }
        }
    }
    
    private func fetchCatDetails(request: CatsDetail.Request, completion: @escaping completionDataCallback<[CatsDetail.CatDetail]>) {
        let catsListProvider = CatsDetailProvider(request: request)
        NetworkProvider(route: catsListProvider).fetch(completion: completion)
    }
}


