//
//  WeatherViewController.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 20.08.2023.
//

import UIKit

//MARK: - Protocols
protocol IWeatherViewController: AnyObject {
    func render(weather: DataWeather)
}

//MARK: - WeatherScreenViewController
final class WeatherViewController: UIViewController {
    
    //MARK: - Private properties
    private let networkManager = NetworkManager.shared
    private var weather: DataWeather!
    
    var dataLabel = UILabel()
    private var degreesLabel = UILabel()
    private var cityLabel = UILabel()
    
    //MARK: - Override metods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private metods
    private func getForecast() {
        networkManager.fetchForecast { result in
            switch result {
            case .success(let weather):
                self.weather = weather
                self.dataLabel.text = weather.forecast.date
            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: - Configure UI
private extension WeatherViewController {
    func setupUI() {
        addSubViews()
        
        setupConctraints()
        
        setupSelfView()
        
        setupDataLabel()
        setupDegreesLabel()
        setupCityLabel()
    }
}

//MARK: - Setup UI
private extension WeatherViewController {
    func setupSelfView() {
        view.backgroundColor = .systemCyan
    }
    
    func addSubViews() {
        [dataLabel, degreesLabel, cityLabel].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    func setupDataLabel() {
        dataLabel.text = "data"
        dataLabel.textColor = .white
        dataLabel.font = UIFont.systemFont(ofSize: 20)
        dataLabel.textAlignment = .center
    }
    
    func setupDegreesLabel() {
        degreesLabel.text = "degrees"
        degreesLabel.textColor = .white
        degreesLabel.font = UIFont.systemFont(ofSize: 35)
        degreesLabel.textAlignment = .center
    }
    
    func setupCityLabel() {
        cityLabel.text = "city"
        cityLabel.textColor = .white
        cityLabel.font = UIFont.systemFont(ofSize: 25)
        cityLabel.textAlignment = .center
    }
}

//MARK: - Constraints
private extension WeatherViewController {
    func setupConctraints() {
        [dataLabel, degreesLabel, cityLabel].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                dataLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                dataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                dataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                degreesLabel.topAnchor.constraint(equalTo: dataLabel.topAnchor, constant: 60),
                degreesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                degreesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                cityLabel.topAnchor.constraint(equalTo: degreesLabel.topAnchor, constant: 60),
                cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                cityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }
    }
}

//MARK: - Extensions for protocol
extension WeatherViewController: IWeatherViewController {
    func render(weather: DataWeather) {
        self.weather = weather
    }
}


