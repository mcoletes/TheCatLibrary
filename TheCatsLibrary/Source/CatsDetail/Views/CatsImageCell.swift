//
//  CatsImageCell.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit
import SDWebImage
class CatsImageCell: UITableViewCell, ReusableView {
    
    private lazy var catImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setup(url: URL) {
        catImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "cat_icon"))
    }
    
    func setup() {
        catImage.image = #imageLiteral(resourceName: "cat_icon")
    }
    
    private func setupUI(){
        addViewHierarchy()
        addConstraints()
        selectionStyle = .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        catImage.removeFromSuperview()
        setupUI()
    }
}
extension CatsImageCell: ViewCodeProtocol {
    func addViewHierarchy() {
        addSubview(catImage)
    }
    
    func addConstraints() {
        catImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32).isActive = true
        catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        catImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        catImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        catImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
}
