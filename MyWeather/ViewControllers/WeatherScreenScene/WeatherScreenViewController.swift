//
//  WeatherScreenViewController.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 20.08.2023.
//

import UIKit

//MARK: - WeatherScreenViewController
final class WeatherScreenViewController: UIViewController {
    
    //MARK: - Private properties
    private let networkManager = NetworkManager.shared
    private var weather: DataWeather!
    
    //MARK: - Override metods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = WeatherScreenView(frame: UIScreen.main.bounds)
    }
    
    //MARK: - Private metods
    private func getForecast() {
        networkManager.fetchForecast { result in
            switch result {
            case .success(let weather):
                self.weather = weather
                view.dataLabel.text = weather.forecast.date
            case .failure(let error):
                print(error)
            }
        }
    }
}


