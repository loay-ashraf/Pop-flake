//
//  MostPopularViewController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import FSPagerView

class MostPopularViewController: UIViewController {

    var pagerViewDataSource: PagerViewDataSource<MostPopularCellViewModel>!
    var pagerViewDelegate: PagerViewDelegate!
    
    var viewModel: MostPopularViewModel!
    
    @IBOutlet weak var pagerView: PagerView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        pagerViewDataSource = MostPopularDataSource()
        pagerViewDelegate = MostPopularDelegate(self)
        viewModel = MostPopularViewModel()
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        load(with: .initial)
    }
    
    // MARK: - View Helper Methods
    
    func configureView() {
        pagerView.transformer = FSPagerViewTransformer(type: .crossFading)
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 10
        pagerView.setDataSource(pagerViewDataSource)
        pagerView.setDelegate(pagerViewDelegate)
    }
    
    // MARK: - View Actions
    
    func showDetail(atItem item: Int) {
        let url = NetworkingConstants.titleURL(forID: viewModel.items[item].id)
        ExternalLinkHelper.openWebsite(url)
    }
    
    func loadTrailer(atItem item: Int, handler: @escaping (String) -> Void) {
        viewModel.loadTrailer(forItem: item) { result in
            switch result {
            case .success(let trailer): handler(trailer.videoID)
            case .failure: return
            }
        }
    }

    // MARK: - Load, Refresh and Reset Methods
    
    func load(with loadingViewState: LoadingViewState) {
        viewModel.load(then: loadHandler(error:))
    }
    
    @objc func refresh() {
        load(with: .refresh)
    }
    
    func reset() {
        viewModel.reset()
    }
    
    // MARK: - Load, Refresh, Paginate and Reset Handlers
    
    func loadHandler(error: Error?) {
        synchronizePagerView()
        pagerView.reloadData()
    }
    
    func refreshHandler(error: Error?) {
        
    }
    
    func resetHandler() {
        
    }
    
    // MARK: - Pager View Synchronization Methods
    
    func synchronizePagerView() {
        pagerViewDataSource.cellViewModels = viewModel.items
    }

}
