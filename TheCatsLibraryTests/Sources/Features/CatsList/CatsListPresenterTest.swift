//
//  CatsListPresenterTest.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import XCTest
@testable import TheCatsLibrary

class CatsListPresenterTest: XCTestCase {
    
    private var sut: CatsListPresenter!
    private var interactor: CatsListInteractor!
    private var worker: CatsListWorkerMock!
    private var viewController: CatsListViewControllerSpy!
    
    override func setUp() {
        super.setUp()
        sut = CatsListPresenter()
        worker = CatsListWorkerMock()
        viewController = CatsListViewControllerSpy()
        interactor = CatsListInteractor(worker: worker)
        interactor.presenter = sut
        sut.viewController = viewController
    }
    
    override func tearDown() {
        sut = nil
        interactor = nil
        worker = nil
    }
    
    func testPresentLoadingAndCats() {
        worker.status = .success
        worker.isLastPage = false
        interactor.fetchListOfCats()
        XCTAssertTrue(viewController.invokedStartLoading)
        XCTAssertTrue(viewController.invokedShowCats)
    }
    
    func testStopLoading() {
        worker.status = .success
        worker.isLastPage = true
        interactor.fetchListOfCats()
        XCTAssertTrue(viewController.invokedStopLoading)
    }
    
    func testPresentError() {
        worker.status = .error
        interactor.fetchListOfCats()
        XCTAssertTrue(viewController.invokedDisplayError)
    }
    
    func testPresentCatsDetail() {
        worker.status = .success
        interactor.fetchListOfCats()
        interactor.didSelectCat(for: 5)
        XCTAssertTrue(viewController.invokedShowCatDetail)
    }
}
