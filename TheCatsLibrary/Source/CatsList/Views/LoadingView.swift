//
//  LoadingView.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 29/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class LoadingView: UICollectionReusableView {
    
    //MARK: constants
    static let kIdentifier = "LoadingView"
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
               activityIndicator.startAnimating()
        activityIndicator.center = self.center
        return activityIndicator
    }()
    
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
extension LoadingView: ViewCodeProtocol {
    func addViewHierarchy() {
        addSubview(activityIndicator)
    }
    
    func addConstraints() {
        // empty implementation no need for constraints at this time
    }
}

