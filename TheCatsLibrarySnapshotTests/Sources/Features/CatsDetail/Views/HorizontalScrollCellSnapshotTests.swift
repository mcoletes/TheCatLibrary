//
//  HorizontalScrollCellSnapshotTests.swift
//  TheCatsLibrarySnapshotTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

import FBSnapshotTestCase
@testable import TheCatsLibrary

class HorizontalScrollCellSnapshotTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testOneBehaviour() {
        let container = TableViewCellSnapshotContainer<HorizontalScrollCell>(width: 375, configureCell: { cell in
            cell.setup(behaviour: [self.createBehaviour()])
        })
            
        FBSnapshotVerifyView(container)
    }
    
    func testMultipleBehaviours() {
        let container = TableViewCellSnapshotContainer<HorizontalScrollCell>(width: 375, configureCell: { cell in
            let behaviours: [CatsDetail.CatBehavior] = (0...5).map { _ in
                self.createBehaviour()
            }
            cell.setup(behaviour: behaviours)
        })
            
        FBSnapshotVerifyView(container)
    }
    
    private func createBehaviour() -> CatsDetail.CatBehavior {
        return CatsDetail.CatBehavior(icon: .cat, name: "Cat Friendly", value: "5")
    }
}
