//
//  Icons.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

enum Icons: String {
    case dog = "ic_dog"
    case cat = "ic_cat"
    case child = "ic_baby"
    case horn = "ic_horn"
    case heart = "ic_heart"
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
