//
//  WeatherScreenView.swift
//  MyWeather
//
//  Created by Elizaveta Medvedeva on 21.02.24.
//

import UIKit

//MARK: - WeatherScreenView
final class WeatherScreenView: UIView {
    
    //MARK: - Private Properties
    private let dataLabel = UILabel()
    private let degreesLabel = UILabel()
    private let cityLabel = UILabel()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configure UI
private extension WeatherScreenView {
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
private extension WeatherScreenView {
    func setupSelfView() {
        backgroundColor = .systemCyan
    }
    
    func addSubViews() {
        [dataLabel, degreesLabel, cityLabel].forEach { subView in
            addSubview(subView)
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
private extension WeatherScreenView {
    func setupConctraints() {
        [dataLabel, degreesLabel, cityLabel].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                dataLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150),
                dataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                dataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
                
                degreesLabel.topAnchor.constraint(equalTo: dataLabel.topAnchor, constant: 60),
                degreesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                degreesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
                
                cityLabel.topAnchor.constraint(equalTo: degreesLabel.topAnchor, constant: 60),
                cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)
            ])
        }
    }
}


