//
//  CatsDetailViewModelTests.swift
//  TheCatsLibraryTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import XCTest
@testable import TheCatsLibrary

class CatsDetailViewModelTests: XCTestCase {
    private var sut: CatsDetailViewModel!
    private var viewController: CatsDetailViewControllerMock!
    private var worker: CatsDetailWorkerMock!

    override func setUp() {
        super.setUp()
        worker = CatsDetailWorkerMock()
        let catsList: [Cat] = JsonLoader().loadFromJsonFile(mock: .catsList)!
        sut = CatsDetailViewModel(cat: catsList.first!, worker: worker)
        viewController = CatsDetailViewControllerMock(viewModel: sut)
    }

    override func tearDown() {
        sut = nil
    }

    func testSuccessFirstLoad() {
        worker.status = .success
        sut.initializer()
        wait {
            XCTAssertTrue(self.viewController.titleCalled)
            XCTAssertTrue(self.viewController.catStateCalled)
            XCTAssertEqual(self.viewController.catStateCountCalled, 1)
            XCTAssertNotEqual(self.viewController.status, Status.error(error: Text.catsDetailErrorMessage.value))
        }
    }

    func testSuccessAfterImageLoaded() {
        sut.initializer()
        worker.status = .success
        sut.fetchCatDetails()
        wait {
            XCTAssertTrue(self.viewController.titleCalled)
            XCTAssertTrue(self.viewController.catStateCalled)
            XCTAssertEqual(self.viewController.catStateCountCalled, 2)
            XCTAssertNotEqual(self.viewController.status, Status.error(error: Text.catsDetailErrorMessage.value))
        }
    }

    func testError() {
        worker.status = .error
        sut.fetchCatDetails()
        wait {
            XCTAssertEqual(self.viewController.status, Status.error(error: Text.catsDetailErrorMessage.value))
        }
    }
}


