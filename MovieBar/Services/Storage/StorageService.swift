//
//  StorageService.swift
//  MovieBar
//
//  Created by Alexandr Rodionov on 23.12.23.
//

import Foundation

final class StorageService {
    
    static let shared: StorageService = .init()
    private init() {}
    
    // MARK: - public methods for saving / loading
    
    
    
    
    // MARK: - private save / load methods
    
    private func save<T: Codable>(_ object: T, key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            UserDefaults.standard.set(data, forKey: key)
            UserDefaults.standard.synchronize()
        } catch {
            print("\(T.Type.self) saving failed")
        }
    }
    
    private func load<T: Codable>(key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            print("\(T.Type.self) loading failed")
            return nil
        }
    }
}
