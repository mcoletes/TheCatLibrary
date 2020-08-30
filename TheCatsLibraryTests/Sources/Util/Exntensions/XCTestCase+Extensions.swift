//
//  XCTestCase+Extensions.swift
//  TheCatsLibraryTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import XCTest

extension XCTestCase {
    func wait(interval: TimeInterval = 0.1 , completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 0.1) // add 0.1 for sure asyn after called
    }
}
