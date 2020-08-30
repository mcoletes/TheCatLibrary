//
//  CatsListCell.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 25/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class CatsListCell: UICollectionViewCell, ReusableView {
    
    
    // MARK: -  constants
    static let kSpacingStackViewElements: CGFloat = Spacing.defaultStackViewSpacing.rawValue
    static let kStackViewBorders: CGFloat = Spacing.defaultMarginSpacing.rawValue
    static let kFontTitle: UIFont = Font.Large.title.value
    static let kFontDescription: UIFont = Font.Large.subtitle.value
    
    
    // MARK: -  Private Properties
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.contentMode = .scaleToFill
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
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Internal Methods
    
    func setup(name: String, description: String, color: UIColor) {
        nameLabel.text = name
        descriptionLabel.text = description
        mainView.backgroundColor = color
    }
    
    // MARK: - Private Methods
    
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
    
    // MARK: - ViewCodeProtocol
    
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
