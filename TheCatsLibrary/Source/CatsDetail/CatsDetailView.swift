//
//  CatsDetailView.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class CatsDetailView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    func setup(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        addViewHierarchy()
        addConstraints()
        registerCells()
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        self.backgroundColor = .white
    }
    
    func reload() {
        self.tableView.reloadData()
    }
    
    private func registerCells() {
        self.tableView.register(TitleSubstitleCell.self)
        self.tableView.register(CatsImageCell.self)
        self.tableView.register(ImageValueDescriptionCell.self)
    }
}

extension CatsDetailView: ViewCodeProtocol {
    func addViewHierarchy() {
        addSubview(tableView)
    }
    
    func addConstraints() {
        tableView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: Spacing.defaultMarginSpacing.rawValue).isActive = true
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Spacing.defaultMarginSpacing.rawValue).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -Spacing.defaultMarginSpacing.rawValue).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -Spacing.defaultMarginSpacing.rawValue).isActive = true
    }
}
