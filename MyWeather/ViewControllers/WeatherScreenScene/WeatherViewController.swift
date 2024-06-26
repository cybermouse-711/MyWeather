//
//  WeatherViewController.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 20.08.2023.
//

import UIKit
import SnapKit

//MARK: - Protocols
protocol IWeatherViewController: AnyObject {
    func render(weather: DataWeather)
}

//MARK: - WeatherScreenViewController
final class WeatherViewController: UIViewController {
    
    //MARK: Private properties
    private var weather: DataWeather!
    
    private let dataLabel = UILabel()
    private let degreesLabel = UILabel()
    private let cityLabel = UILabel()
    
    //MARK: Properties
    var presenter: IWeatherPresenter?
    
    //MARK: Override metods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.fetchData()
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

        dataLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.snp.top).offset(150)
        }
        
        degreesLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(dataLabel.snp.bottom).offset(50)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(degreesLabel.snp.bottom).offset(50)
        }
    }
}

//MARK: - Extensions for protocol
extension WeatherViewController: IWeatherViewController {
    func render(weather: DataWeather) {
        self.weather = weather
        self.dataLabel.text = weather.flightNumber.formatted()
        self.cityLabel.text = weather.dateLocal
        self.degreesLabel.text = weather.name
    }
}


