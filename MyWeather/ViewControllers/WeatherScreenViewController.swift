//
//  WeatherScreenViewController.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 20.08.2023.
//

import UIKit

class WeatherScreenViewController: UIViewController {
    
    private let dataWeather = NetworkManager.shared
    
    private let dataLabel = UILabel()
    private let degreesLabel = UILabel()
    private let cityLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        deletedConstraint()
        createdConstraint()
        createdElement()
    }
}



private extension WeatherScreenViewController {
    
    func addSubview() {
        view.addSubview(dataLabel)
        view.addSubview(degreesLabel)
        view.addSubview(cityLabel)
    }
    
    func deletedConstraint() {
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        degreesLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createdConstraint() {
        NSLayoutConstraint.activate([
            dataLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            dataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            degreesLabel.topAnchor.constraint(equalTo: dataLabel.topAnchor, constant: 40),
            degreesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            degreesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            cityLabel.topAnchor.constraint(equalTo: degreesLabel.topAnchor, constant: 40),
            cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
        ])
    }
    
    func createdElement() {
        dataLabel.text = ""
        dataLabel.textAlignment = .center
        
        degreesLabel.text = ""
        degreesLabel.textAlignment = .center
        
        cityLabel.text = ""
        cityLabel.textAlignment = .center
        
        view.backgroundColor = .lightGray
    }
}
