//
//  CatsListCellSnapshotTests.swift
//  TheCatsLibrarySnapshotTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import FBSnapshotTestCase
@testable import TheCatsLibrary

class CatsListCellSnapshotTests: BaseSnapshotView {
    
    var sut: CatsListCell!
    
    override func setUp() {
        
        sut = CatsListCell()
        super.baseSetup(sut: sut)
        view.addSubview(sut)
        sut.center = view.center
        sut.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        sut.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sut.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sut.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true
    }
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testDisplay() {
        sut.setup(name: "Cats name", description: "Bried catsDescription", color: UIColor.systemBlue)
        
        FBSnapshotVerifyView(view)
    }
    
     func testDisplayLongInfo() {
           sut.setup(name: "Cats name", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", color: UIColor.black)

           FBSnapshotVerifyView(view)
       }
}
