//
//  CatsDetailViewController.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class CatsDetailViewController: UIViewController, CustomizableView {
    
    // MARK: - Typealias
    
    typealias CustomView = CatsDetailView
    private var viewModel: CatsDetailViewModelProtocol
    var items: [CatsDetail.CatsDetailType] = []
    
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
        viewModel.fetchCatDetails()
    }
}

extension CatsDetailViewController: BindableView {
    func bindProperties() {
        viewModel.catState.bind { [weak self] (catDetail) in
            guard let self = self, let items = catDetail?.items else { return }
            self.items = items
            self.customView.reload()
        }
        viewModel.title.bind { [weak self] (title) in
            self?.title = title
        }
        
        viewModel.state.bind { [weak self] (state) in
            switch state {
            case .loading:
                self?.customView.startLoading()
            case .success:
               self?.customView.stopLoading()
            case .error(let message):
                self?.customView.stopLoading()
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
            let cell: CatsImageCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(url: url)
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
}
