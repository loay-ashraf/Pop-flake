//
//  HomeViewModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

// MARK: - Cell Models

final class FullMovieCellViewModel: CollectionCellViewModel {
    
    // MARK: - Properties
    
    typealias ModelType = FullMovie
    
    var model: FullMovie
    var id: String
    var title: String
    var rating: String
    var ratingCount: String
    var year: String
    var contentRating: String
    var runtimeString: String
    var image: URL
    
    // MARK: - Initialization
    
    init() {
        model = FullMovie()
        id = ""
        title = ""
        rating = ""
        ratingCount = ""
        year = ""
        contentRating = ""
        runtimeString = ""
        image = URL(string: "www.imdb.com")!
    }
    
    init(from model: FullMovie) {
        self.model = model
        id = model.id
        title = model.title
        rating = model.imDBRating
        ratingCount = model.imDBRatingCount
        year = model.year
        contentRating = model.contentRating
        runtimeString = model.runtimeStr
        image = model.image
    }
    
}

final class CompactMovieCellViewModel: CollectionCellViewModel {
    
    // MARK: - Properties
    
    typealias ModelType = CompactMovie
    
    var model: CompactMovie
    var id: String
    var title: String
    var year: String
    var rating: String
    var ratingCount: String
    var image: URL
    
    // MARK: - Initialization
    
    init() {
        model = CompactMovie()
        id = ""
        title = ""
        year = ""
        rating = ""
        ratingCount = ""
        image = URL(string: "www.imdb.com")!
    }
    
    init(from model: CompactMovie) {
        self.model = model
        id = model.id
        title = model.title
        year = model.year
        rating = model.imDBRating
        ratingCount = model.imDBRatingCount
        image = model.image
    }
    
}
