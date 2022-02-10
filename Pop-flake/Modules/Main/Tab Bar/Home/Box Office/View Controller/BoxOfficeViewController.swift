//
//  BoxOfficeViewController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class BoxOfficeViewController: SFDynamicTableViewController<BoxOfficeViewModel> {

    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tableViewDataSource = BoxOfficeDataSource()
        tableViewDelegate = BoxOfficeDelegate(self)
        viewModel = BoxOfficeViewModel()
        //emptyViewModel = EmptyConstants.Users.viewModel
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        load(with: .initial)
    }
    
    // MARK: - View Actions
    
    func showDetail(atRow row: Int) {
        let url = NetworkingConstants.titleURL(forID: viewModel.items[row].id)
        ExternalLinkHelper.openWebsite(url)
    }
    
    // MARK: - View Helper Methods
    
    override func configureView() {
        super.configureView()
        disableRefreshControl()
        xTableView.isScrollable = false
    }

    // MARK: - Loading Methods

    override func load(with loadingViewState: LoadingViewState) {
        super.load(with: loadingViewState)
        switch loadingViewState {
        case .initial: viewModel?.load { [weak self] error in self?.loadHandler(error: error) }
        case .refresh: viewModel?.refresh { [weak self] error in self?.refreshHandler(error: error) }
        default: break
        }
    }

}
