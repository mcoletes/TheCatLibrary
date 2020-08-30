//
//  CatsDetailViewControllerTests.swift
//  TheCatsLibrarySnapshotTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import FBSnapshotTestCase
@testable import TheCatsLibrary

class CatsDetailViewControllerTests: BaseSnapshot {
    
    var sut: CatsDetailViewController!
    var viewModel: CatsDetailViewModel!
    var worker: CatsDetailWorkerMock!
    
    override func setUp() {
        let worker = CatsDetailWorkerMock()
        let catsList: [Cat] = JsonLoader().loadFromJsonFile(mock: .catsList)!
        let cat = catsList.first!
        let viewModel = CatsDetailViewModel(cat: cat, worker: worker)
        sut = CatsDetailViewController(viewModel: viewModel)
        super.baseSetup(vc: sut)
        //recordMode = true
    }
    
    override func tearDown() {
        sut = nil
        viewModel = nil
        worker = nil
    }
    
    func test() {
        FBSnapshotVerifyViewController(sut)
    }
}
