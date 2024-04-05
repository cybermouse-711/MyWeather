//
//  WeatherRouter.swift
//  MyWeather
//
//  Created by Elizaveta Medvedeva on 05.04.24.
//

import UIKit

//MARK: - Protocols
protocol IWeatherRouter: BaseRouting {}

//MARK: - WeatherRouter
final class WeatherRouter {
    
    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

//MARK: - Extensions for protocol
extension WeatherRouter: IWeatherRouter {
    func routeTo(Target: Any) {
        
    }
}
