//
//  CatsImageCell.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit
import SDWebImage

protocol UpdateImageProtocol {
    func imageDidUpdate(url: String)
}

class CatsImageCell: UITableViewCell, ReusableView {
    
    // MARK: - Private Properties
    
    private lazy var catImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Public Methods
    
    func setup(url: URL) {
        catImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "cat_icon"))
    }
    
    func setup() {
        catImage.image = #imageLiteral(resourceName: "cat_icon")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        addViewHierarchy()
        addConstraints()
        selectionStyle = .none
    }
}
extension CatsImageCell: ViewCodeProtocol {
    
    // MARK: - ViewCodeProtocol
    
    func addViewHierarchy() {
        addSubview(catImage)
    }
    
    func addConstraints() {
        catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        catImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        catImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        catImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
