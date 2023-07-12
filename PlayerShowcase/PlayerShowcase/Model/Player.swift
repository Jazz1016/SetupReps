//
//  Player.swift
//  PlayerShowcase
//
//  Created by James Lea on 7/12/23.
//

import Foundation

struct Player: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let firstName: String
    let lastName: String
    let position: String
    let height: String
    let weight: String
    let jerseyNumber: String
    let image: String
    // Add any additional properties you want to showcase

    // Add convenience initializer if needed
}



class MockData {
    
    static let jazzPlayers: [Player] = [
        Player(firstName: "John", lastName: "Collins", position: "PF", height: "6'9\"", weight: "235 lbs", jerseyNumber: "20", image: "collins"),
        Player(firstName: "Collin", lastName: "Sexton", position: "SG", height: "6'1\"", weight: "190 lbs", jerseyNumber: "2", image: "sexton"),
        Player(firstName: "Lauri", lastName: "Markkanen", position: "SF", height: "7'0\"", weight: "240 lbs", jerseyNumber: "23", image: "markkanen"),
        Player(firstName: "Kelly", lastName: "Olynyk", position: "C", height: "6'11\"", weight: "240 lbs", jerseyNumber: "41", image: "olynyk"),
        Player(firstName: "Talen", lastName: "Horton-Tucker", position: "PG", height: "6'4\"", weight: "234 lbs", jerseyNumber: "5", image: "horton"),
        Player(firstName: "Jordan", lastName: "Clarkson", position: "SG", height: "6'4\"", weight: "195 lbs", jerseyNumber: "00", image: "clarkson"),
        Player(firstName: "Taylor", lastName: "Hendricks", position: "PF", height: "6'9\"", weight: "210 lbs", jerseyNumber: "0", image: "hendricks"),
        Player(firstName: "Ochai", lastName: "Agbaji", position: "SG", height: "6'5\"", weight: "215 lbs", jerseyNumber: "30", image: "agbaji"),
        Player(firstName: "Keyonte", lastName: "George", position: "PG", height: "6'4\"", weight: "185 lbs", jerseyNumber: "3", image: "playerNotFound"),
        Player(firstName: "Simone", lastName: "Fontecchio", position: "SF", height: "6'8\"", weight: "209 lbs", jerseyNumber: "16", image: "fontecchio"),
        Player(firstName: "Walker", lastName: "Kessler", position: "C", height: "7'1\"", weight: "245 lbs", jerseyNumber: "24", image: "kessler"),
        Player(firstName: "Kris", lastName: "Dunn", position: "PG", height: "6'3\"", weight: "205 lbs", jerseyNumber: "11", image: "dunn"),
        Player(firstName: "Brice", lastName: "Sensabaugh", position: "SF", height: "6'6\"", weight: "235 lbs", jerseyNumber: "8", image: "playerNotFound"),
        Player(firstName: "Joey", lastName: "Hauser", position: "SF", height: "6'9\"", weight: "230 lbs", jerseyNumber: "10", image: "playerNotFound")
    ]
    
}
