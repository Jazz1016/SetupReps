//
//  Cat.swift
//  Cat-Image-Viewer
//
//  Created by James Lea on 5/22/23.
//

import Foundation

struct Cat: Decodable, Identifiable {
    let id: String
    let url: String
    let width: Int
    let height: Int
}

struct MockData {
    static let sampleCats: [Cat] = [
        Cat(id: "1", url: "https://example.com/cat1.jpg", width: 800, height: 600),
        Cat(id: "2", url: "https://example.com/cat2.jpg", width: 1024, height: 768),
        Cat(id: "3", url: "https://example.com/cat3.jpg", width: 1200, height: 900),
        Cat(id: "4", url: "https://example.com/cat4.jpg", width: 640, height: 480),
        Cat(id: "5", url: "https://example.com/cat5.jpg", width: 1920, height: 1080),
        Cat(id: "6", url: "https://example.com/cat6.jpg", width: 1280, height: 720),
        Cat(id: "7", url: "https://example.com/cat7.jpg", width: 960, height: 540),
        Cat(id: "8", url: "https://example.com/cat8.jpg", width: 1440, height: 900),
        Cat(id: "9", url: "https://example.com/cat9.jpg", width: 1600, height: 1200),
        Cat(id: "10", url: "https://example.com/cat10.jpg", width: 1366, height: 768),
        Cat(id: "11", url: "https://example.com/cat11.jpg", width: 800, height: 480),
        Cat(id: "12", url: "https://example.com/cat12.jpg", width: 1280, height: 800),
        Cat(id: "13", url: "https://example.com/cat13.jpg", width: 1024, height: 600),
        Cat(id: "14", url: "https://example.com/cat14.jpg", width: 1600, height: 900),
        Cat(id: "15", url: "https://example.com/cat15.jpg", width: 1920, height: 1200),
        Cat(id: "16", url: "https://example.com/cat16.jpg", width: 640, height: 360),
        Cat(id: "17", url: "https://example.com/cat17.jpg", width: 1280, height: 1024),
        Cat(id: "18", url: "https://example.com/cat18.jpg", width: 800, height: 800),
        Cat(id: "19", url: "https://example.com/cat19.jpg", width: 1440, height: 1080),
        Cat(id: "20", url: "https://example.com/cat20.jpg", width: 1024, height: 768)
    ]

}
