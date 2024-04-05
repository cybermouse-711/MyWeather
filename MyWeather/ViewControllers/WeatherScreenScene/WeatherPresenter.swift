//
//  WeatherPresenter.swift
//  MyWeather
//
//  Created by Elizaveta Medvedeva on 05.04.24.
//

import UIKit

//MARK: - Protocols
protocol IWeatherPresenter {
    func weather(model: DataWeather)
}

//MARK: - WeatherPresenter
final class WeatherPresenter {
    
   private let router: IWeatherRouter
    
    init(router: IWeatherRouter) {
        self.router = router
    }
}

//MARK: - Extensions for protocol
extension WeatherPresenter: IWeatherPresenter {
    func weather(model: DataWeather) {
        
    }
}
