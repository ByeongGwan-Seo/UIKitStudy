//
//  MovieModel.swift
//  MovieList
//
//  Created by seobyeonggwan on 2023/01/16.
//

import Foundation

struct MovieModel: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let trackName: String?
    let previewUrl: String?
    let artworkUrl100: String?
    let shortDescription: String?
    let longDescription: String?
    let trackPrice: Double?
    let currency: String?
    let releaseDate: String?
}
