//
//  SFDynamicCollectionView.swift
//  GitIt
//
//  Created by Loay Ashraf on 29/12/2021.
//

import UIKit

class SFDynamicCollectionView: CollectionView, StatefulView {

    // MARK: - Properties
    
    var state: ViewState = .presenting
    
    var isSuperView: Bool = false
    var isScrollable: Bool = true
    
    var errorAction: (() -> Void)?
    
    private var emptyView: EmptyView!
    private var activityIndicatorView: ActivityIndicatorView!
    private var errorView: ErrorView!
    
    // MARK: - Initialization
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initializeSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeSubviews()
    }
    
    private func initializeSubviews() {
        emptyView = EmptyView.instanceFromNib()
        activityIndicatorView = ActivityIndicatorView.instanceFromNib()
        errorView = ErrorView.instanceFromNib()
        errorView.configureAction { [ weak self ] in self?.errorAction!() }
    }
    
    // MARK: - View State Methods
    
    func transition(to viewState: ViewState) {
        defer { render(viewState) }
        switch state {
        case .loading(let loadingViewState): hideActivityIndicator(for: loadingViewState)
        case .failed(let failedViewState): hideError(for: failedViewState)
        default: return
        }
    }
    
    func render(_ viewState: ViewState) {
        state = viewState
        switch viewState {
        case .presenting: reloadData()
        case .empty(let emptyContext): showEmpty(for: emptyContext)
        case .loading(let loadingViewState): showActivityIndicator(for: loadingViewState)
        case .failed(let failedViewState): showError(for: failedViewState)
        }
    }
    
    func showEmpty(for model: EmptyViewModel) {
        emptyView.show(on: self, with: model)
    }
    
    func hideEmpty() {
        emptyView.hide()
    }
    
    func showActivityIndicator(for loadingViewState: LoadingViewState) {
        switch loadingViewState {
        case .initial: if isSuperView == false {
                            activityIndicatorView.show(on: self)
                        } else if isSuperView {
                            //addSubview(curtainView)
                            //showAnimatedSkeleton()
                        }
                        isScrollEnabled = false
        default: return
        }
    }
    
    func hideActivityIndicator(for loadingViewState: LoadingViewState) {
        switch loadingViewState {
        case .initial: if isSuperView == false {
                            activityIndicatorView.hide()
                        } else if isSuperView {
                            //curtainView.removeFromSuperview()
                            //hideSkeleton()
                        }
                        isScrollable ? isScrollEnabled = true : nil
        case .refresh: refreshControl?.endRefreshing()
        default: return
        }
    }
    
    func showError(for failedViewState: FailedViewState) {
        switch failedViewState {
        case .initial(let error),.refresh(let error): errorView.show(on: self, with: ErrorViewModel(from: error)); self.isScrollEnabled = false
        default: return
        }
    }
    
    func hideError(for failedViewState: FailedViewState) {
        switch failedViewState {
        case .initial,.refresh: errorView.hide(); self.isScrollEnabled = true
        default: return
        }
    }

}
