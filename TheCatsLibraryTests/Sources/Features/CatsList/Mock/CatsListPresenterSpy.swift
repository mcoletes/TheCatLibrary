//
//  CatsListPresenterSpu.swift
//  TheCatsLibraryTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

@testable import TheCatsLibrary

class CatsListPresenterSpy: CatsListPresenter {

    var invokedViewControllerSetter = false
    var invokedViewControllerSetterCount = 0
    var invokedViewController: CatsListDisplayLogic?
    var invokedViewControllerList = [CatsListDisplayLogic?]()
    var invokedViewControllerGetter = false
    var invokedViewControllerGetterCount = 0
    var stubbedViewController: CatsListDisplayLogic!

    override var viewController: CatsListDisplayLogic? {
        set {
            invokedViewControllerSetter = true
            invokedViewControllerSetterCount += 1
            invokedViewController = newValue
            invokedViewControllerList.append(newValue)
        }
        get {
            invokedViewControllerGetter = true
            invokedViewControllerGetterCount += 1
            return stubbedViewController
        }
    }

    var invokedPresentLoading = false
    var invokedPresentLoadingCount = 0

    override func presentLoading() {
        invokedPresentLoading = true
        invokedPresentLoadingCount += 1
    }

    var invokedStopLoading = false
    var invokedStopLoadingCount = 0

    override func stopLoading() {
        invokedStopLoading = true
        invokedStopLoadingCount += 1
    }

    var invokedPresentCats = false
    var invokedPresentCatsCount = 0
    var invokedPresentCatsParameters: (cats: [Cat], isLastPage: Bool)?
    var invokedPresentCatsParametersList = [(cats: [Cat], isLastPage: Bool)]()
    var isLastPage = false
    override func presentCats(cats: [Cat], isLastPage: Bool) {
        invokedPresentCats = true
        self.isLastPage = isLastPage
        invokedPresentCatsCount += 1
        invokedPresentCatsParameters = (cats, isLastPage)
        invokedPresentCatsParametersList.append((cats, isLastPage))
    }

    var invokedPresentCatDetail = false
    var invokedPresentCatDetailCount = 0

    override func presentCatDetail() {
        invokedPresentCatDetail = true
        invokedPresentCatDetailCount += 1
    }

    var invokedPresentError = false
    var invokedPresentErrorCount = 0
    var invokedPresentErrorParameters: (action: EmptyClosure?, Void)?
    var invokedPresentErrorParametersList = [(action: EmptyClosure?, Void)]()

    override func presentError(action: EmptyClosure?) {
        invokedPresentError = true
        invokedPresentErrorCount += 1
        invokedPresentErrorParameters = (action, ())
        invokedPresentErrorParametersList.append((action, ()))
    }
}

