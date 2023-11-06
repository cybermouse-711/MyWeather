//
//  DataWeather.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 06.11.2023.
//

import Foundation

struct DataWeather: Decodable {
    let info: Info
    let fact: Fact
    let forecast: Forecast
}

struct Info: Decodable {
    var lat: Int
    var lon: Int
}

struct Fact: Decodable {
    var temp: Int
}

struct Forecast: Decodable {
    var date: String
}

/*
extension DataWeather {
    static func getWeather() -> DataWeather {
        DataWeather(date: "12.09.2023", temp: 15, lat: 1, lon: 1)
    }
}
*/
