//
//  CatsListViewController.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 24/08/20.
//  Copyright (c) 2020 Mauro Coletes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CatsListDisplayLogic: class, ViewControllerErrorProtocol {
    func startLoading()
    func stopLoading()
    func showCats(cats: [CatsList.CatVM])
    func showCatDetail()
}

class CatsListViewController: UIViewController, CatsListDisplayLogic, ViewControllerErrorProtocol {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var leftCollectionViewMargin: NSLayoutConstraint!
    @IBOutlet weak var rightCollectionViewMargin: NSLayoutConstraint!
    
    // MARK: - Internal Properties
    
    var interactor: CatsListBusinessLogic?
    var router: (NSObjectProtocol & CatsListRoutingLogic & CatsListDataPassing)?
    
    // MARK: - Private Properties
    
    private var viewModel = CatsList.ViewModel()
    private var footerHeight: CGFloat = 80
    
    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Override Methods
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = CatsListInteractor()
        let presenter = CatsListPresenter()
        let router = CatsListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupCollectionView()
        fetchCats()
    }
    
    // MARK: - Internal Methods
    
    func startLoading() {
        footerHeight = 50
    }
    
    func stopLoading() {
        footerHeight = 0
    }
    
    func showCats(cats: [CatsList.CatVM]) {
        viewModel.cats.append(contentsOf: cats)
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    func showCatDetail() {
        router?.routeToCatDetail()
    }
    
    // MARK: - Private Methods
    
    private func setupCollectionView() {
        collectionView.prefetchDataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.register(LoadingView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: LoadingView.defaultReuseIdentifier)
        self.collectionView.register(CatsListCell.self)
    }
    
    private func setupTitle() {
        self.title = viewModel.title
    }
    
    private func fetchCats() {
        interactor?.fetchListOfCats()
    }
}

extension CatsListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CatsListCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let cat = viewModel.cats[indexPath.row]
        cell.setup(name: cat.name, description: cat.description, color: cat.color.color)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.didSelectCat(for: indexPath.row)
    }
}
extension CatsListViewController: UICollectionViewDataSourcePrefetching {
    
    // MARK: - UICollectionViewDataSourcePrefetching
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            interactor?.loadNextPageIfNeeded(for: indexPath.row)
        }
    }
}

extension CatsListViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cat = viewModel.cats[indexPath.row]
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
            assert(false, "Unexpected element kind")
        }
    }
}