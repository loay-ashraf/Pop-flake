//
//  HomePagerViewMediaHandler.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import FSPagerView

class MostPopularMediaHandler: PagerViewMediaHandler {
    
    override func loadVideo(atItem item: Int, completion: @escaping (String) -> Void) {
        if let viewController = viewController as? MostPopularViewController{
            viewController.loadTrailer(atItem: item) { videoID in
                completion(videoID)
            }
        }
    }
    
    override func playVideo(videoID: String, inCell cell: FSPagerViewCell, atItem item: Int) {
        super.playVideo(videoID: videoID, inCell: cell, atItem: item)
        if let cell = cell as? MostPopularCell, let playerView = cell.playerView {
            playerView.delegate = self
            playerView.isHidden = false
            playerView.load(withVideoId: videoID, playerVars: ["playsinline":1])
        }
    }
    
    override func stopVideo() {
        super.stopVideo()
        if let cell = currentCell as? MostPopularCell, let playerView = cell.playerView {
            playerView.stopVideo()
            playerView.isHidden = true
        }
    }
    
}
