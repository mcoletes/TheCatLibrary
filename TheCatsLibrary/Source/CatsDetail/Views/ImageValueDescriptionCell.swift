//
//  ImageValueDescriptionCell.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class ImageValueDescriptionCell: UITableViewCell, ReusableView {
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Spacing.defaultStackViewSpacing.rawValue
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(horizontalStackView)
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.contentMode = .left
        stackView.spacing = Spacing.defaultStackViewSpacing.rawValue
        stackView.addArrangedSubview(icon)
        stackView.addArrangedSubview(subtitleLabel)
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Font.Small.title.value
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Font.Large.title.value
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    func setup(title: String, subtitle: String, image: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        icon.image = UIImage(named: image)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addViewHierarchy()
        addConstraints()
    }
}

extension ImageValueDescriptionCell: ViewCodeProtocol {
    func addViewHierarchy() {
        addSubview(mainView)
        mainView.addSubview(stackView)
    }
    
    func addConstraints() {
        mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: Spacing.defaultMarginSpacing.rawValue).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Spacing.defaultMarginSpacing.rawValue).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: Spacing.defaultMarginSpacing.rawValue).isActive = true
        stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -Spacing.defaultMarginSpacing.rawValue).isActive = true
        stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: Spacing.defaultMarginSpacing.rawValue).isActive = true
        stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -Spacing.defaultMarginSpacing.rawValue).isActive = true
        
        icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
}

