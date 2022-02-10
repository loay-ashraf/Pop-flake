//
//  HomeViewController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import youtube_ios_player_helper

class HomeViewController: UITableViewController {
    
    var boxOfficeViewController: BoxOfficeViewController?
    var comingSoonViewController: ComingSoonViewController?
    var inTheatersViewController: InTheatersViewController?
    var mostPopularViewController: MostPopularViewController?
    var topRatedViewController: TopRatedViewController?
    
    // MARK: - View Outlets
    
    @IBOutlet weak var refeshControl: UIRefreshControl!
    @IBOutlet weak var playerView: YTPlayerView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.standard.applyPreferedTheme()
        playerView.load(withVideoId: "q0DEtLupD8c", playerVars: ["playsinline":1])
    }
    
    // MARK: - View Action
    
    @IBAction func rereshControlValueChanged(_ sender: UIRefreshControl) {
        boxOfficeViewController?.load(with: .refresh)
        comingSoonViewController?.load(with: .refresh)
        inTheatersViewController?.load(with: .refresh)
        mostPopularViewController?.load(with: .refresh)
        topRatedViewController?.load(with: .refresh)
        refeshControl.endRefreshing()
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let boxOfficeViewController as BoxOfficeViewController: self.boxOfficeViewController = boxOfficeViewController
        case let comingSoonViewController as ComingSoonViewController: self.comingSoonViewController = comingSoonViewController
        case let inTheatersViewController as InTheatersViewController: self.inTheatersViewController = inTheatersViewController
        case let mostPopularViewController as MostPopularViewController: self.mostPopularViewController = mostPopularViewController
        case let topRatedViewController as TopRatedViewController: self.topRatedViewController = topRatedViewController
        default:break
        }
    }
    
}

extension HomeViewController: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    
}
