//
//  ViewCodeViews.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

protocol ViewCodeProtocol {
    func addViewHierarchy()
    func addConstraints()
}

extension ViewCodeProtocol where Self: UIViewController {
    func addViewHierarchy() {
        self.viewDidLoad()
    }
}
