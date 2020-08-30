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
    
    var items: [CatsDetail.CatsDetailType] = []
    var viewModel: CatsDetailViewModelProtocol
    
    // MARK: - Private Properties
    
    private var indexPath: IndexPath?
    
    // MARK: - Init
    
    init(viewModel: CatsDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = CatsDetailView(frame: view.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setup(delegate: self, dataSource: self)
        viewModel.initializer()
        viewModel.fetchCatDetails()
    }
    
    // MARK: - BindableView
    
    func bindProperties() {
        viewModel.catState.bind { [weak self] (catDetail) in
            guard let self = self, let items = catDetail?.items else { return }
            self.items = items
            DispatchQueue.main.async {
                self.customView.reload()
            }
        }
        viewModel.title.bind { [weak self] title in
             DispatchQueue.main.async {
                self?.title = title
            }
        }
        
        viewModel.state.bind { [weak self] state in
            switch state {
            case .error(let message):
                 DispatchQueue.main.async {
                    self?.displayError(message: message, actionButtonTitle: Text.warningButtonTryAgain.value, tryAgainAction: self?.viewModel.fetchCatDetails)
                }
            default:
                break
            }
        }
    }
}


extension CatsDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = items[indexPath.row]
        switch data {
        case .detail(let name, let description):
            let cell: TitleSubstitleCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(title: name, subtitle: description)
            return cell
        case .image(let url):
            self.indexPath = indexPath
            let cell: CatsImageCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            if let url = url {
                cell.setup(url: url)
            } else {
                cell.setup()
            }
            return cell
        case .iconTextValue(let behaviour):
            let cell: HorizontalScrollCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(behaviour: behaviour)
            return cell
        }
    }
}
