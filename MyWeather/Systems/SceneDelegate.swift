//
//  SceneDelegate.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 20.08.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let weatherVC = WeatherViewController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = weatherVC
        
        let weatherAssambly = WeatherAssembly(vc: weatherVC)
        weatherAssambly.configure(viewController: weatherVC)
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        guard let windowScene = scene as? UIWindowScene else { return }
        window?.windowScene = windowScene
    }
}

