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
        guard let vc = viewController as? WeatherViewController else { return }
        let worker = WeatherWorker()
        let presenter = WeatherPresenter(vc: vc, worker: worker)
        vc.presenter = presenter
    }
}

