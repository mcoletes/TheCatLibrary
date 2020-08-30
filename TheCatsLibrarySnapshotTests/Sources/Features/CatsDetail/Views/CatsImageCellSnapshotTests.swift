//
//  CatsImageCellSnapshotTests.swift
//  TheCatsLibrarySnapshotTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import FBSnapshotTestCase
@testable import TheCatsLibrary

class CatsImageCellSnapshotTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCell() {
        let container = TableViewCellSnapshotContainer<CatsImageCell>(width: 375, configureCell: { cell in
             cell.setup()
        })
            
        FBSnapshotVerifyView(container)
    }
}

