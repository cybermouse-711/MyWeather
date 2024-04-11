//
//  WeatherPresenter.swift
//  MyWeather
//
//  Created by Elizaveta Medvedeva on 05.04.24.
//

import UIKit

//MARK: - Protocols
protocol IWeatherPresenter {
    func fetchData()
}

//MARK: - WeatherPresenter
final class WeatherPresenter {
    
    weak var vc: IWeatherViewController?
    private let worker: IWeatherWorker
    
    init(vc: IWeatherViewController,worker: IWeatherWorker) {
        self.vc = vc
        self.worker = worker
    }
}

//MARK: - Extensions for protocol
extension WeatherPresenter: IWeatherPresenter {
    func fetchData() {
        worker.fetchForecast { result in
            switch result {
            case .success(let weather):
                self.vc?.render(weather: weather)
                print(weather)
            case .failure(let error):
                print(error)
            }
        }
    }
}
