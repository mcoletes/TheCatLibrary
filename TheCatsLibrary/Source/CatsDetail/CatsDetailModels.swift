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
        case iconTextValue(icon: String, text: String, value: String)
    }
    
    struct CollectionViewModel{
        let icon: String
        let value: String
    }
    
    struct ViewState {
        var items: [CatsDetailType]
        
        init(cat: Cat, url: String) {
            self.items = [CatsDetailType]()
            if let url = URL(string: url) {
                items.append(.image(url: url))
            }
            items.append(contentsOf: setupCat(cat: cat))
        }
        
        init(cat: Cat){
            self.items = [CatsDetailType]()
            self.items = setupCat(cat: cat)
        }
        
        private func setupCat(cat: Cat) ->  [CatsDetailType] {
            var items = [CatsDetailType]()
            items.append(.image(url: nil))
            items.append(.detail(name: "description".uppercased(), description: cat.description))
            if let dogFriendly = cat.dogFriendly {
                items.append(.iconTextValue(icon: "ic_dog", text: "Dog friendly", value: "\(dogFriendly)"))
            }
            if let catFriendly = cat.catFriendly {
                items.append(.iconTextValue(icon: "ic_cat", text: "Cat friendly", value: "\(catFriendly)"))
            }
            if let childFriendly = cat.childFriendly {
                items.append(.iconTextValue(icon: "ic_baby", text: "Child friendly", value: "\(childFriendly)"))
            }
            if let vocalisation = cat.vocalisation {
                items.append(.iconTextValue(icon: "ic_horn", text: "Vocalisation", value: "\(vocalisation)"))
            }
            if let affectionLevel = cat.affectionLevel {
                items.append(.iconTextValue(icon: "ic_heart", text: "Affection level", value: "\(affectionLevel)"))
            }
            
            //TODO ADD TO RESOURCES STRINGS AND CREATE ENUM FOR ICONS
            return items
        }
    }
}
