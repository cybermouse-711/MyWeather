//
//  WeatherPresenter.swift
//  MyWeather
//
//  Created by Elizaveta Medvedeva on 05.04.24.
//

import UIKit

//MARK: - Protocols
protocol IWeatherPresenter {
    func weather(weather: DataWeather)
}

//MARK: - WeatherPresenter
final class WeatherPresenter {
   // private let router: String
}

//MARK: - Extensions for protocol
extension WeatherPresenter: IWeatherPresenter {
    func weather(model: DataWeather) {
        
    }
}
