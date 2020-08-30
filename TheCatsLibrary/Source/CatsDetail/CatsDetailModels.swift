//
//  CatsDetailModels.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

enum CatsDetail {
    
    struct Request {
        var id: String
    }
    
    struct CatDetail: Codable {
         let url: String
    }
    
    enum CatsDetailType {
        case image(url: URL)
        case detail(name: String, description: String)
        case collectionView(cells: [CollectionViewModel])
    }
    
    struct CollectionViewModel{
        let icon: String
        let value: String
    }
    
    struct ViewState {
        var items: [CatsDetailType]
        
        init(cat: Cat, url: String) {
            var items = [CatsDetailType]()
            if let url = URL(string: url) {
                items.append(.image(url: url))
            }
            items.append(.detail(name: "description".uppercased(), description: cat.description))
            self.items = items
        }
    }
}
