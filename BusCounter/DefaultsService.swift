//
//  DefaultsService.swift
//  BusCounter
//
//  Created by Michal Gruszkiewicz on 09/12/2021.
//

import Foundation

public protocol DefaultsService: Codable {
    static var keyName: String { get }
}

extension DefaultsService {
    public func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: Self.keyName)
        }
    }
    
    static func saveArray(_ array: [Self]) {
        if let data = try? PropertyListEncoder().encode(array) {
            UserDefaults.standard.set(data, forKey: Self.keyName)
        }
    }
    
    public static func read<T>() -> T? where T: DefaultsService {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: T.keyName) as? Data {
            let decoder = JSONDecoder()
            if let model = try? decoder.decode(T.self, from: data) {
                return model
            }
        }
        return nil
    }
    
    static func readArray<T>() -> [T] where T: DefaultsService {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: T.keyName), let array = try? PropertyListDecoder().decode([T].self, from: data) {
            return array
        }
        return []
    }
}
