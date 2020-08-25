//
//  CatsListViewController.swift
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

protocol CatsListDisplayLogic: class
{
    func stopFirstAnimation()
}

class CatsListViewController: UIViewController, CatsListDisplayLogic
{
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var interactor: CatsListBusinessLogic?
    var router: (NSObjectProtocol & CatsListRoutingLogic & CatsListDataPassing)?
    
    // MARK: Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CatsListInteractor()
        let presenter = CatsListPresenter()
        let router = CatsListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getListOfCats()
    }
    
    func stopFirstAnimation() {
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
        }
    }
}
