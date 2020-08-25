//
//  CatsListPresenter.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 24/08/20.
//  Copyright (c) 2020 Mauro Coletes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CatsListPresentationLogic {
    func stopAnimating()
}

class CatsListPresenter: CatsListPresentationLogic {
    
  weak var viewController: CatsListDisplayLogic?
  
    func stopAnimating() {
        viewController?.stopFirstAnimation()
    }
}