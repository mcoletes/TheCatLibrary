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
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .red
        return view
    }()
    
    private lazy var catImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.contentMode = .scaleAspectFill
        //imageView.backgroundColor = .black
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       // setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(url: URL) {
        setup()
        imageView?.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "cat_icon"))
    }
    
    private func setup(){
        addViewHierarchy()
        addConstraints()
    }

}
extension CatsImageCell: ViewCodeProtocol {
    func addViewHierarchy() {
        addSubview(mainView)
        mainView.addSubview(catImage)
    }
    
    func addConstraints() {
        mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        catImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        catImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        catImage.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        catImage.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    }
}
