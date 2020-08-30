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
        case image(url: URL?)
        case detail(name: String, description: String)
        case iconTextValue(behaviour: [CatBehavior])
    }
    
    struct CatBehavior {
        let icon: Icons
        let name: String
        let value: String
    }
    
    struct CollectionViewModel{
        let icon: String
        let value: String
    }
    
    struct ViewState {
        var items: [CatsDetailType]
        
        init(cat: Cat, href: String? = nil) {
            self.items = []
            if let href = href, let url = URL(string: href) {
                items.append(.image(url: url))
            } else {
                items.append(.image(url: nil))
            }
            items.append(contentsOf: setupCat(cat: cat))
        }
        
        private func setupCat(cat: Cat) ->  [CatsDetailType] {
            var items: [CatsDetailType] = []
            var behaviour: [CatBehavior] = []
            items.append(.detail(name: Text.description.value, description: cat.description))
            if let dogFriendly = cat.dogFriendly {
                behaviour.append(CatBehavior(icon: .dog, name: Text.dogFriendly.value, value: "\(dogFriendly)"))
            }
            if let catFriendly = cat.catFriendly {
                behaviour.append(CatBehavior(icon: .cat, name: Text.catFriendly.value, value: "\(catFriendly)"))
            }
            if let childFriendly = cat.childFriendly {
                behaviour.append(CatBehavior(icon: .child, name: Text.childFriendly.value, value: "\(childFriendly)"))
            }
            if let vocalisation = cat.vocalisation {
                behaviour.append(CatBehavior(icon: .horn, name: Text.vocalisation.value, value: "\(vocalisation)"))
            }
            if let affectionLevel = cat.affectionLevel {
                behaviour.append(CatBehavior(icon: .heart, name:Text.affectionLevel.value, value: "\(affectionLevel)"))
            }
            items.append(.iconTextValue(behaviour: behaviour))
            
            if let temperament = cat.temperament {
                items.append(.detail(name: Text.temperament.value, description: temperament.replacingOccurrences(of: ", ", with: "\n")))
            }
            
            return items
        }
    }
}
