//
//  CustomizableView.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

protocol CustomizableView: AnyObject {
    associatedtype CustomView
    
    var customView: CustomView { get }
}

extension CustomizableView where Self: UIViewController {
    var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("could not cast custom view")
        }
        return customView
    }
}
