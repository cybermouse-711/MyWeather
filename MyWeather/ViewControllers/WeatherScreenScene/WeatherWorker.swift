//
//  WeatherWorker.swift
//  MyWeather
//
//  Created by Elizaveta Medvedeva on 05.04.24.
//

import UIKit

//MARK: - Protocols
protocol IWeatherWorker {
    func fetch()
}

//MARK: - WeatherRouter
final class WeatherWorker {
    
    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

//MARK: - Extensions for protocol
extension WeatherWorker: IWeatherWorker {
    func fetch() {
        <#code#>
    }
}

