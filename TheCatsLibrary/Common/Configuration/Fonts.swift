//
//  Fonts.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

enum Font {
    enum Large {
        case title
        case subtitle
        
        var value: UIFont {
            switch self {
            case .title:
                return .systemFont(ofSize: 22, weight: .semibold)
            case .subtitle:
                return .systemFont(ofSize: 18)
            }
        }
    }
    enum Small {
        case title
        case subtitle
        
        var value: UIFont {
            switch self {
            case .title:
                return .systemFont(ofSize: 16, weight: .semibold)
            case .subtitle:
                return .systemFont(ofSize: 14)
            }
        }
    }
    
}
