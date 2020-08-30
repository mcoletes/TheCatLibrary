//
//  CatsListCell.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 25/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class CatsListCell: UICollectionViewCell, ReusableView {
    
    
    //MARK: constants
    static let kSpacingStackViewElements: CGFloat = 8
    static let kStackViewBorders: CGFloat = 16
    static let kFontTitle: UIFont = UIFont.systemFont(ofSize: 22, weight: .semibold)
    static let kFontDescription: UIFont = UIFont.systemFont(ofSize: 18)
    
    
    //MARK: Private Properties
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = CatsListCell.kSpacingStackViewElements
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CatsListCell.kFontTitle
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CatsListCell.kFontDescription
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    
    func setup(name: String, description: String) {
        self.nameLabel.text = name
        self.descriptionLabel.text = description
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        setupUI()
        addViewHierarchy()
        addConstraints()
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension CatsListCell: ViewCodeProtocol {
    func addViewHierarchy() {
        addSubview(mainView)
        mainView.addSubview(stackView)
    }
    
    func addConstraints() {
        
        mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: CatsListCell.kStackViewBorders).isActive = true
        stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -CatsListCell.kStackViewBorders).isActive = true
        stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: CatsListCell.kStackViewBorders).isActive = true
        stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -CatsListCell.kStackViewBorders).isActive = true
    }
}
