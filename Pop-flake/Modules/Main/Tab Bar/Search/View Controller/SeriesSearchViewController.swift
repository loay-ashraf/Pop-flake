//
//  SeriesSearchViewController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class SeriesSearchViewController: SFDynamicTableViewController<SeriesSearchViewModel> {
    
    // MARK: - Properties
    
    var query: String = "" {
        didSet {
            load(with: .initial)
        }
    }
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tableViewDataSource = SearchResultDataSource()
        tableViewDelegate = SearchResultDelegate(self)
        viewModel = SeriesSearchViewModel()
        emptyViewModel = EmptyConstants.SearchResults.viewModel
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        xTableView.transition(to: .empty(emptyViewModel))
    }
    
    // MARK: - View Actions
    
    func showDetail(atRow row: Int) {
        let url = NetworkingConstants.titleURL(forID: viewModel.items[row].id)
        ExternalLinkHelper.openWebsite(url)
    }
    
    func setQuery(query: String) {
        self.query = query
    }
    
    // MARK: - View Helper Methods
    
    override func configureView() {
        super.configureView()
        xTableView.isScrollable = false
    }

    // MARK: - Loading Methods

    override func load(with loadingViewState: LoadingViewState) {
        super.load(with: loadingViewState)
        if !query.isEmpty {
            switch loadingViewState {
            case .initial: viewModel?.load(withQuery: query) { [weak self] error in self?.loadHandler(error: error) }
            case .refresh: viewModel?.refresh(withQuery: query) { [weak self] error in self?.refreshHandler(error: error) }
            default: break
            }
        }
    }
    
}
