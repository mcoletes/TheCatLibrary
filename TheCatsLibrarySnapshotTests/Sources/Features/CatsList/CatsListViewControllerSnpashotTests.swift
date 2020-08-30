//
//  CatsListViewControllerSnpashotTests.swift
//  TheCatsLibrarySnapshotTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import FBSnapshotTestCase
@testable import TheCatsLibrary

class CatsListViewControllerSnapshotTests: BaseSnapshot {
    
    var sut: CatsListViewController!
    var presenter: CatsListPresenter!
    var interactor: CatsListInteractor!
    var worker: CatsListWorkerMock!
    
    override func setUp() {
        sut = CatsListViewController()
        sut.view.translatesAutoresizingMaskIntoConstraints = false
        super.baseSetup(vc: sut)
        presenter = CatsListPresenter()
        presenter.viewController = sut
        worker = CatsListWorkerMock()
        interactor = CatsListInteractor(worker: worker)
        interactor.presenter = presenter
        sut.interactor = interactor
    }
    
    func testLoading() {
        sut.startLoading()
        FBSnapshotVerifyViewController(sut)
    }
    
    func testFetchedCatsList() {
        sut.viewDidLoad()
        FBSnapshotVerifyViewController(sut)
    }
    
    func testLastPage() {
        worker.isLastPage = true
        sut.viewDidLoad()
        FBSnapshotVerifyViewController(sut)
    }
}
