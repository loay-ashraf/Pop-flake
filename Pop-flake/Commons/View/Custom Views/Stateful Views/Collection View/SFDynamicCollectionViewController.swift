//
//  SFDynamicCollectionViewController.swift
//  GitIt
//
//  Created by Loay Ashraf on 29/12/2021.
//

import UIKit

class SFDynamicCollectionViewController<T: CollectionViewModel>: UICollectionViewController {
    
    // MARK: - Properties
    
    var xCollectionView: SFDynamicCollectionView! { return collectionView as? SFDynamicCollectionView }
    
    var collectionViewDataSource: CollectionViewDataSource<T.CollectionCellViewModelType>!
    var collectionViewDelegate: CollectionViewDelegate!
    
    var viewModel: T!
    var emptyViewModel: EmptyViewModel = Constants.View.Empty.General.viewModel
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    deinit {
        xCollectionView.transition(to: .presenting)
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        if xCollectionView == nil {
            // re-initialize table view with SFDynamic table view initializer
            let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first
            collectionView = SFDynamicCollectionView(frame: window!.bounds, collectionViewLayout: UICollectionViewLayout())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    // MARK: - View Helper Methods
    
    func configureView() {
        // Setup collection data source and delegates
        xCollectionView.setDataSource(collectionViewDataSource)
        xCollectionView.setDelegate(collectionViewDelegate)
        // Setup collection view refresh control
        //enableRefreshControl()
        // Setup error actions
        xCollectionView.errorAction = { [weak self] in self?.load(with: .initial) }
    }
    
    func updateView() {
        synchronizeCollectionView()
        xCollectionView.reloadData()
    }

    func enableSearchBar() {
        navigationItem.searchController?.searchBar.isUserInteractionEnabled = true
        navigationItem.searchController?.searchBar.alpha = 1.0
    }
    
    func disableSearchBar() {
        navigationItem.searchController?.searchBar.isUserInteractionEnabled = false
        navigationItem.searchController?.searchBar.alpha = 0.5
    }
    
    func enableRefreshControl() {
        xCollectionView.refreshControl = UIRefreshControl()
        xCollectionView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    func disableRefreshControl() {
        xCollectionView.refreshControl?.removeTarget(self, action: #selector(refresh), for: .valueChanged)
        xCollectionView.refreshControl = nil
    }
    
    func enableBouncing(direction: UICollectionView.ScrollDirection) {
        switch direction {
        case .horizontal: xCollectionView.alwaysBounceHorizontal = true
                          xCollectionView.alwaysBounceVertical = false
        case .vertical: xCollectionView.alwaysBounceVertical = true
                        xCollectionView.alwaysBounceHorizontal = false
        @unknown default: return
        }
    }
    
    func disableBouncing(direction: UICollectionView.ScrollDirection) {
        switch direction {
        case .horizontal: xCollectionView.alwaysBounceHorizontal = false
        case .vertical: xCollectionView.alwaysBounceVertical = false
        @unknown default: return
        }
    }
    
    // MARK: - Load, Refresh and Reset Methods
    
    func load(with loadingViewState: LoadingViewState) {
        xCollectionView.transition(to: .loading(loadingViewState))
    }
    
    @objc func refresh() {
        load(with: .refresh)
    }
    
    func reset() {
        xCollectionView.transition(to: .loading(.initial))
    }
    
    // MARK: - Load, Refresh, Paginate and Reset Handlers
    
    func loadHandler(error: Error?) {
        if let error = error {
            xCollectionView.transition(to: .failed(.initial(error)))
            disableSearchBar()
        } else if viewModel.isEmpty {
            xCollectionView.transition(to: .empty(emptyViewModel))
            disableSearchBar()
        } else {
            synchronizeCollectionView()
            xCollectionView.transition(to: .presenting)
            enableSearchBar()
        }
    }
    
    func refreshHandler(error: Error?) {
        if let error = error {
            xCollectionView.transition(to: .failed(.refresh(error)))
            disableSearchBar()
        } else {
            synchronizeCollectionView()
            xCollectionView.transition(to: .presenting)
            enableSearchBar()
        }
    }
    
    func resetHandler() {
        xCollectionView.transition(to: .presenting)
        enableSearchBar()
    }
    
    // MARK: - Collection View Synchronization Methods
    
    func synchronizeCollectionView() {
        collectionViewDataSource.cellViewModels = viewModel.items
    }

}
