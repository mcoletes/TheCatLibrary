//
//  CatsDetailViewController.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class CatsDetailViewController: UIViewController, CustomizableView, ViewControllerErrorProtocol, BindableView {
    
    // MARK: - Typealias
    
    typealias CustomView = CatsDetailView
    
    // MARK: - Internal Properties
    
    var dataSource = CatsDetailDataSource()
    var viewModel: CatsDetailViewModelProtocol
    
    // MARK: - Init
    
    init(viewModel: CatsDetailViewModelProtocol) {
        self.viewModel = viewModel
        //view not loaded from nib, override load view to set view
        super.init(nibName: nil, bundle: nil)
        bindProperties()
    }
    
    required init?(coder: NSCoder) {
        //view not loaded from storyboard, override loadview to set view
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = CatsDetailView(frame: view.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setup(dataSource: dataSource)
        viewModel.initializer()
        viewModel.fetchCatDetails()
    }
    
    // MARK: - BindableView
    
    func bindProperties() {
        viewModel.catState.bind { [weak self] (catDetail) in
            guard let self = self, let items = catDetail?.items else { return }
            self.dataSource.items = items
            DispatchQueue.main.async {
                self.customView.reload()
            }
        }
        viewModel.title.bind { [weak self] title in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.title = title
            }
        }
        
        viewModel.state.bind { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .error(let message):
                DispatchQueue.main.async {
                    self.displayError(message: message, actionButtonTitle: Text.warningButtonTryAgain.value, tryAgainAction: self.viewModel.fetchCatDetails)
                }
            default:
                break
            }
        }
    }
}
