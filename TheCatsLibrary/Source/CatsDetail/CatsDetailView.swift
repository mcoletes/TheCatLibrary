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
        return tableView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    func setup(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        addViewHierarchy()
        addConstraints()
        registerCells()
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        self.backgroundColor = .white
    }
    func startLoading() {
        activityIndicator.startAnimating()
    }
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
    
    func reload() {
        self.tableView.reloadData()
    }
    
    private func registerCells() {
        self.tableView.register(TitleSubstitleCell.self)
        self.tableView.register(CatsImageCell.self)
    }
}

extension CatsDetailView: ViewCodeProtocol {
    func addViewHierarchy() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    func addConstraints() {
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.defaultMarginSpacing.rawValue).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: Spacing.defaultMarginSpacing.rawValue).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Spacing.defaultMarginSpacing.rawValue).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.defaultMarginSpacing.rawValue).isActive = true
    }
}
