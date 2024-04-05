//
//  WeatherAssembly.swift
//  MyWeather
//
//  Created by Elizaveta Medvedeva on 05.04.24.
//

import UIKit

//MARK: - WeatherAssembly
final class WeatherAssembly {
    
    private let vc: UIViewController
    
    init(vc: UIViewController) {
        self.vc = vc
    }
}

//MARK: - Extensions for protocol
extension WeatherAssembly: BaseAssembly {
    func configure(viewController: UIViewController) {
        guard let weatherVC = viewController as? WeatherViewController else { return }
        let router = WeatherRouter(viewController: vc)
        let presenter = WeatherPresenter(router: router)
        weatherVC.presenter = presenter
    }
}

