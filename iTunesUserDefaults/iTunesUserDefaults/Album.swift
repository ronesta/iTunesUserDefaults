//
//  Album.swift
//  iTunesUserDefaults
//
//  Created by Ибрагим Габибли on 14.11.2024.
//

import Foundation

struct PostAlbums: Codable {
    let results: [Album]
}

struct Album: Codable {
    let artistId: Int
    let artistName: String
    let collectionName: String
    let artworkUrl100: String
    let collectionPrice: Double
}