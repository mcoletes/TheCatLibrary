//
//  CatsListCollectionViewDelegates.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 02/09/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class CatsListCollectionViewDelegates: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var cats: [CatsList.CatVM]
    var footerHeight: CGFloat = 50
    
    private var interactor: CatsListBusinessLogic?
    
    init(cats: [CatsList.CatVM] = [], interactor: CatsListBusinessLogic) {
        self.interactor = interactor
        self.cats = cats
    }

    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CatsListCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let cat = cats[indexPath.row]
        cell.setup(name: cat.name, description: cat.description, color: cat.color.color)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.didSelectCat(for: indexPath.row)
    }
}

extension CatsListCollectionViewDelegates: UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cat = cats[indexPath.row]
        let width = collectionView.bounds.width - (2 * CatsListCell.kStackViewBorders)
        
        let titleSize = cat.name.height(withConstrainedWidth: width , font: CatsListCell.kFontTitle)
        let descriptionSize = cat.description.height(withConstrainedWidth: width, font: CatsListCell.kFontDescription)
        
        //title necessary height + description necessaryHeight + Cats List stack view spacing between elements + 2 times borders (top and bottom)
        //used this aproach because prefetch does not work when colection view layout is set to UICollectionViewFlowLayout.automaticSize
        return CGSize(width: collectionView.bounds.width, height: (titleSize + descriptionSize + CatsListCell.kSpacingStackViewElements + (2 * CatsListCell.kStackViewBorders)))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: footerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LoadingView.defaultReuseIdentifier, for: indexPath)
        default:
           return UICollectionReusableView()
        }
    }
}

extension CatsListCollectionViewDelegates: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            interactor?.loadNextPageIfNeeded(for: indexPath.row)
        }
    }
}

