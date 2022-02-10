//
//  PagerViewMediaHandler.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import FSPagerView
import youtube_ios_player_helper

class PagerViewMediaHandler: NSObject {
    
    weak var viewController: UIViewController?
    var playerView: YTPlayerView?
    var currentCell: FSPagerViewCell?
    var currentIndex: Int = 0
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func loadVideo(atItem item: Int, completion: @escaping (String) -> Void) { /* override this method in sub classes */ }
    
    func playVideo(videoID: String, inCell cell: FSPagerViewCell, atItem item: Int) {
        /* override this method in sub classes */
        currentCell = cell
    }
    func stopVideo() { /* override this method in sub classes */ }
    
}

extension PagerViewMediaHandler: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    
}

