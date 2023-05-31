//
//  City.swift
//  Weather-App
//
//  Created by James Lea on 5/30/23.
//

import Foundation

struct City: Identifiable, Hashable, Codable {
    let id: Int
    let name: String
}

struct Cities {
    static let list: [City] = [
        City(id: 1, name: "New York"),
        City(id: 2, name: "Los Angeles"),
        City(id: 3, name: "Chicago"),
        City(id: 4, name: "Houston"),
        City(id: 5, name: "Phoenix"),
        City(id: 6, name: "Philadelphia"),
        City(id: 7, name: "San Antonio"),
        City(id: 8, name: "San Diego"),
        City(id: 9, name: "Dallas"),
        City(id: 10, name: "San Jose"),
        City(id: 11, name: "Austin"),
        City(id: 12, name: "Jacksonville"),
        City(id: 13, name: "Fort Worth"),
        City(id: 14, name: "Columbus"),
        City(id: 15, name: "San Francisco"),
        City(id: 16, name: "Charlotte"),
        City(id: 17, name: "Indianapolis"),
        City(id: 18, name: "Seattle"),
        City(id: 19, name: "Denver"),
        City(id: 20, name: "Washington, D.C."),
        City(id: 21, name: "Salt Lake City"),
        City(id: 22, name: "West Valley City"),
        City(id: 23, name: "Provo"),
        City(id: 24, name: "West Jordan"),
        City(id: 25, name: "Orem"),
        City(id: 26, name: "Sandy"),
        City(id: 27, name: "St. George"),
        City(id: 28, name: "Layton"),
        City(id: 29, name: "South Jordan"),
        City(id: 30, name: "Lehi")
    ]
}


final class SelectedCity: ObservableObject {
    @Published var city: City?
    
    func updateCity(city: City) {
        self.city = city
    }
    
}
