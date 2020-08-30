//
//  ViewStates.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

enum Status: Equatable {
    case none
    case loading
    case success
    case error(error: String)
}
