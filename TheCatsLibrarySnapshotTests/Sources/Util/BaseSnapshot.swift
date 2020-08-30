//
//  BaseSnapshot.swift
//  TheCatsLibrarySnapshotTests
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit
import FBSnapshotTestCase

class BaseSnapshot: FBSnapshotTestCase {
    
    var vc: UIViewController!
    
    func baseSetup(vc: UIViewController) {
        super.setUp()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = vc
    }
}

class BaseSnapshotView: FBSnapshotTestCase {
    
    var view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    func baseSetup(sut: UIView) {
        super.setUp()
        view.addSubview(sut)
        sut.center = view.center
    }
}
