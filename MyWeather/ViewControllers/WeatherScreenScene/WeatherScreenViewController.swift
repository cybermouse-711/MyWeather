//
//  WeatherScreenViewController.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 20.08.2023.
//

import UIKit

//MARK: - WeatherScreenViewController
final class WeatherScreenViewController: UIViewController {
    
    private let dataWeather = NetworkManager.shared
    
    //MARK: - Override metods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = WeatherScreenView(frame: UIScreen.main.bounds)
    }
}


