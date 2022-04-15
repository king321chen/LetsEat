//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by cobi321 on 2022/4/10.
//

import Foundation

class LocationDataManager {
    private var locations: [String] = []
    private func loadData() -> [[String: String]] {
        let decoder = PropertyListDecoder()
        if let path = Bundle.main.path(forResource: "Locations", ofType: "plist"),
           let locationData = FileManager.default.contents(atPath: path),
           let locations = try? decoder.decode([[String: String]].self, from: locationData) {
            return locations
        }
        return [[:]]
    }
    func fetch() {
        for location in loadData() {
            if let city = location["city"], let state = location["state"] {
                locations.append("\(city), \(state)")
            }
        }
    }
    func numberOfLocationItems() -> Int {
        locations.count
    }
    func locationItem(at index: Int) -> String {
        locations[index]
    }
}
