//
//  CatsDetailViewController.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class CatsDetailViewController: UIViewController, CustomizableView, ViewControllerErrorProtocol {
    
    // MARK: - Typealias
    typealias CustomView = CatsDetailView
    
    // MARK: - Internal Properties
    
    var items: [CatsDetail.CatsDetailType] = []
   
     // MARK: - Private Properties
    private var indexPath: IndexPath?
    private var viewModel: CatsDetailViewModelProtocol

    // MARK: - Initialier
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
}

extension CatsDetailViewController: BindableView {
    
    // MARK: - BindableView
    
    func bindProperties() {
        viewModel.catState.bind { [weak self] (catDetail) in
            guard let self = self, let items = catDetail?.items else { return }
            self.items = items
            self.customView.reload()
        }
        viewModel.title.bind { [weak self] title in
            self?.title = title
        }
        
        viewModel.state.bind { [weak self] state in
            switch state {
            case .error(let message):
                //TODO handle error
                break
            default:
                break
            }
        }
    }
}


extension CatsDetailViewController: UITableViewDataSource, UITableViewDelegate {
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
        case .iconTextValue(let icon, let text, let value):
            let cell: ImageValueDescriptionCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(title: text, subtitle: value, image: icon)
            return cell
        }
    }
}
