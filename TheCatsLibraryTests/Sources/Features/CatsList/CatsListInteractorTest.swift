//
//  CatsListInteractorTest.swift
//  TheCatsLibraryTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import XCTest
@testable import TheCatsLibrary

class CatsListInteractorTest: XCTestCase {
    
    private var sut: CatsListInteractor!
    private var presenter: CatsListPresenterSpy!
    private var worker: CatsListWorkerMock!
    override func setUp() {
        super.setUp()
        worker = CatsListWorkerMock()
        sut = CatsListInteractor(worker: worker)
        presenter = CatsListPresenterSpy()
        sut.presenter = presenter
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
    }
    
    func testSuccessReturnListOfCatsAndIsNotLastPage() {
        worker.status = .success
        worker.isLastPage = false
        sut.fetchListOfCats()
        XCTAssertTrue(presenter.invokedPresentCats)
        XCTAssertFalse(presenter.isLastPage)
    }
    
    func testSuccessReturnListOfCatsAndIsLastPage() {
        worker.status = .success
        worker.isLastPage = true
        sut.fetchListOfCats()
        XCTAssertTrue(presenter.invokedPresentCats)
        XCTAssertTrue(presenter.isLastPage)
    }
    
    func testShouldPresentError() {
        worker.status = .error
        sut.fetchListOfCats()
        XCTAssertTrue(presenter.invokedPresentError)
    }
    
    func testShouldLoadNextPage() {
        worker.status = .success
        sut.fetchListOfCats()
        sut.loadNextPageIfNeeded(for: 19)
        XCTAssertEqual(presenter.invokedPresentCatsCount, 2)
    }
    
    func testShouldNotLoadNextPage() {
        worker.status = .success
        sut.fetchListOfCats()
        sut.loadNextPageIfNeeded(for: 2)
        XCTAssertEqual(presenter.invokedPresentCatsCount, 1)
    }
    
    func testShouldSelectCat() {
        worker.status = .success
        sut.fetchListOfCats()
        sut.didSelectCat(for: 25)
        XCTAssertFalse(presenter.invokedPresentCatDetail)
    }
    
    func testShouldNotSelectCat() {
        worker.status = .success
        sut.fetchListOfCats()
        sut.didSelectCat(for: 2)
        XCTAssertTrue(presenter.invokedPresentCatDetail)
    }
}
