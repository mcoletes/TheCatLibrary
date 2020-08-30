//
//  LoadingViewSnapshotTests.swift
//  TheCatsLibrarySnapshotTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import FBSnapshotTestCase
@testable import TheCatsLibrary

class LoadingViewSnapshotTests: BaseSnapshotView {
    
    var sut: LoadingView!
    
    override func setUp() {
        
        sut = LoadingView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        super.baseSetup(sut: sut)
        view.addSubview(sut)
        view.backgroundColor = .white
        sut.center = view.center
    }
    func testDisplay() {
        FBSnapshotVerifyView(view)
    }
}
