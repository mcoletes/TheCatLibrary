//
//  Text.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

internal enum Text: String {
    //=======ERROR/WARNING VIEW==========//
    case warningTitle
    case warningButtonDismissTitle
    case warningButtonTryAgain
    
    //=======CATS LIST==========//
    case catsListTitle
    case catsListLastCatTitle
    case catsListLastCatDescription
    
    //=======CAT DETAIL==========//
    case catsDetailTitle
    case description
    case dogFriendly
    case catFriendly
    case childFriendly
    case vocalisation
    case affectionLevel
    case temperament
    
    public var value: String {
        return String(describing: self.rawValue).localized()
    }
    
}
