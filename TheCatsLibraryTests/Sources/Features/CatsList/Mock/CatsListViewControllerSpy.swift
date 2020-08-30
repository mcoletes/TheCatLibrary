//
//  CatsListViewControllerSpy.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

@testable import TheCatsLibrary

class CatsListViewControllerSpy: CatsListDisplayLogic {

    var invokedStartLoading = false
    var invokedStartLoadingCount = 0

    func startLoading() {
        invokedStartLoading = true
        invokedStartLoadingCount += 1
    }

    var invokedStopLoading = false
    var invokedStopLoadingCount = 0

    func stopLoading() {
        invokedStopLoading = true
        invokedStopLoadingCount += 1
    }

    var invokedShowCats = false
    var invokedShowCatsCount = 0
    var invokedShowCatsParameters: (cats: [CatsList.CatVM], Void)?
    var invokedShowCatsParametersList = [(cats: [CatsList.CatVM], Void)]()

    func showCats(cats: [CatsList.CatVM]) {
        invokedShowCats = true
        invokedShowCatsCount += 1
        invokedShowCatsParameters = (cats, ())
        invokedShowCatsParametersList.append((cats, ()))
    }

    var invokedShowCatDetail = false
    var invokedShowCatDetailCount = 0

    func showCatDetail() {
        invokedShowCatDetail = true
        invokedShowCatDetailCount += 1
    }

    var invokedDisplayError = false
    var invokedDisplayErrorCount = 0
    var invokedDisplayErrorParameters: (message: String, actionButtonTitle: String?, tryAgainAction: EmptyClosure?)?
    var invokedDisplayErrorParametersList = [(message: String, actionButtonTitle: String?, tryAgainAction: EmptyClosure?)]()

    func displayError(message: String, actionButtonTitle: String?, tryAgainAction: EmptyClosure?) {
        invokedDisplayError = true
        invokedDisplayErrorCount += 1
        invokedDisplayErrorParameters = (message, actionButtonTitle, tryAgainAction)
        invokedDisplayErrorParametersList.append((message, actionButtonTitle, tryAgainAction))
    }
}
