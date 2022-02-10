//
//  BoxOfficeModel.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation

// MARK: - BoxOfficeMovie
struct BoxOfficeMovie: Model {
    let id, rank, title: String
    let image: URL
    let weekend, gross, weeks: String
}
