//
//  DataWeather.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 06.11.2023.
//

import Foundation

struct DataWeather {
    var data: String
    var degrees: String
    var city: String
    //data
}

extension DataWeather {
    static func getWeather() -> DataWeather {
        DataWeather(data: "12.09.2023", degrees: "15", city: "Moscow")
    }
}
