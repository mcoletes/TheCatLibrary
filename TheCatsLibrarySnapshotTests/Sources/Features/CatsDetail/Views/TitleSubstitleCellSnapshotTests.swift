//
//  TitleSubstitleCellSnapshotTests.swift
//  TheCatsLibrarySnapshotTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import FBSnapshotTestCase
@testable import TheCatsLibrary

class TitleSubstitleCellSnapshotTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCellSmallContent() {
        let container = TableViewCellSnapshotContainer<TitleSubstitleCell>(width: 375, configureCell: { cell in
            cell.setup(title: "Small title", subtitle: "here is a small subtitle")
        })
            
        FBSnapshotVerifyView(container)
    }
    
    func testCellLargeContent() {
        let container = TableViewCellSnapshotContainer<TitleSubstitleCell>(width: 375, configureCell: { cell in
            cell.setup(title: "What is Lorem Ipsum?", subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        })
            
        FBSnapshotVerifyView(container)
    }
}
