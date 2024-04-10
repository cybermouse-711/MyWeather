//
//  DataWeather.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 06.11.2023.
//

import Foundation

struct DataWeather: Decodable {
    let links: Links
    let flightNumber: Int
    let name: String
    let dateUtc: String
    let dateLocal: String
    
    struct Links: Decodable {
        let webcast: String
        let youtubeId: String
        let wikipedia: String
    }
}


