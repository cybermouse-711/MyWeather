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
    
   private let worker: IWeatherWorker
    
    init(worker: IWeatherWorker) {
        self.worker = worker
    }
}

//MARK: - Extensions for protocol
extension WeatherPresenter: IWeatherPresenter {
    func weather(model: DataWeather) {
        
    }
}
