//
//  CatsListRouter.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 24/08/20.
//  Copyright (c) 2020 Mauro Coletes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol CatsListRoutingLogic {
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CatsListDataPassing {
  var dataStore: CatsListDataStore? { get }
}

class CatsListRouter: NSObject, CatsListRoutingLogic, CatsListDataPassing {
  weak var viewController: CatsListViewController?
  var dataStore: CatsListDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: CatsListViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: CatsListDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
