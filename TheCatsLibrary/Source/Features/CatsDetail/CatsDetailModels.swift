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
            
            appendBehaviourIfNotNull(list: &behaviour, icon: .dog, name: Text.dogFriendly.value, value: cat.dogFriendly)
            appendBehaviourIfNotNull(list: &behaviour, icon: .cat, name: Text.catFriendly.value, value: cat.catFriendly)
            appendBehaviourIfNotNull(list: &behaviour, icon: .child, name: Text.childFriendly.value, value: cat.childFriendly)
            appendBehaviourIfNotNull(list: &behaviour, icon: .horn, name: Text.vocalisation.value, value: cat.vocalisation)
            appendBehaviourIfNotNull(list: &behaviour, icon: .heart, name: Text.affectionLevel.value, value: cat.affectionLevel)
            
            items.append(.iconTextValue(behaviour: behaviour))
            
            if let temperament = cat.temperament {
                items.append(.detail(name: Text.temperament.value, description: temperament.replacingOccurrences(of: ", ", with: "\n")))
            }
            
            return items
        }
        
        private func appendBehaviourIfNotNull(list: inout [CatBehavior], icon: Icons, name: String, value: Int?) {
            if let value = value {
                list.append(CatBehavior(icon: icon, name: name, value: "\(value)"))
            }
        }
    }
}
