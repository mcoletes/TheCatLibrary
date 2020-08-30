//
//  HorizontalScrollCell.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 30/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class HorizontalScrollCell: UITableViewCell, ReusableView {
    
    // MARK: - Private Properties
    
    private lazy var collectionView: UICollectionView = {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(ImageValueDescriptionCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    // MARK: - Internal Properties
    
    var behaviour: [CatsDetail.CatBehavior] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Internal Methods
    
    func setup(behaviour: [CatsDetail.CatBehavior]) {
        self.behaviour = behaviour
    }
    
    func setup() {
        selectionStyle = .none
        addViewHierarchy()
        addConstraints()
    }
}

extension HorizontalScrollCell: ViewCodeProtocol {
    
    // MARK: - ViewCodeProtocol
    
    func addViewHierarchy() {
        addSubview(collectionView)
    }
    
    func addConstraints() {
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: Spacing.defaultMarginSpacing.rawValue).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Spacing.defaultMarginSpacing.rawValue).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

extension HorizontalScrollCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return behaviour.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageValueDescriptionCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let behaviour = self.behaviour[indexPath.row]
        cell.setup(title: behaviour.name, subtitle: behaviour.value, icon: behaviour.icon)
        return cell
    }
}

extension HorizontalScrollCell: UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 150)
    }
}


