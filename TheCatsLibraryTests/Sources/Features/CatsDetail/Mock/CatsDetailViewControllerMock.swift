//
//  CatsDetailViewControllerMock.swift
//  TheCatsLibraryTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

@testable import TheCatsLibrary

class CatsDetailViewControllerMock: CatsDetailViewController {
    
    var catStateCalled: Bool = false
    var titleCalled: Bool = false
    var stateCalled: Bool = false
    var catStateCountCalled: Int = 0
    var status: Status = .none
    
    override func bindProperties() {
        viewModel.catState.bind { catDetail in
            self.catStateCalled = true
            self.catStateCountCalled += 1
        }
        viewModel.title.bind {  title in
            self.title = title
            self.titleCalled = true
        }
        
        viewModel.state.bind {  state in
            self.status = state
            self.stateCalled = true
        }
    }
}
