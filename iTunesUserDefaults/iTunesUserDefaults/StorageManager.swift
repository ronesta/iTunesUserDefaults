//
//  StorageManager.swift
//  iTunesUserDefaults
//
//  Created by Ибрагим Габибли on 14.11.2024.
//

import Foundation
import UIKit

class StorageManager {
    static let shared = StorageManager()
    private let albumsKey = "albumsKey"
    private let historyKey = "searchHistory"
    private init() {}

    func saveCharacters(_ albums: [Album]) {
        do {
            let data = try JSONEncoder().encode(albums)
            UserDefaults.standard.set(data, forKey: albumsKey)
        } catch {
            print("Failed to encode characters: \(error)")
        }
    }

    func saveImage(_ image: Data, key: String) {
        UserDefaults.standard.set(image, forKey: key)
    }

    func saveSearchTerm(_ term: String) {
        var history = getSearchHistory()
        if !history.contains(term) {
            history.append(term)
            UserDefaults.standard.set(history, forKey: historyKey)
        }
    }

    func loadCharacters() -> [Album]? {
        if let data = UserDefaults.standard.data(forKey: albumsKey) {
            do {
                let albums = try JSONDecoder().decode([Album].self, from: data)
                return albums
            } catch {
                print("Failed to encode: \(error)")
                return nil
            }
        } else {
            return nil
        }
    }

    func loadImage(key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }

    func getSearchHistory() -> [String] {
        return UserDefaults.standard.array(forKey: historyKey) as? [String] ?? []
    }

    func clearAlbums() {
        UserDefaults.standard.removeObject(forKey: albumsKey)
    }

    func clearImage(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }

    func clearHistory() {
        UserDefaults.standard.removeObject(forKey: historyKey)
    }
}