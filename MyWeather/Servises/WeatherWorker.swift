//
//  WeatherWorker.swift
//  MyWeather
//
//  Created by Elizaveta Medvedeva on 05.04.24.
//

import UIKit
import Alamofire

//MARK: - Enums
enum NetworkError: Error {
    case noData, invalidURL, decodingError
}

//MARK: - Protocols
protocol IWeatherWorker {
    func fetchForecast(completion: @escaping(Result<DataWeather, Error>) -> Void)
}

//MARK: - WeatherRouter
final class WeatherWorker {

}

//MARK: - Extensions for protocol
extension WeatherWorker: IWeatherWorker {
    func fetchForecast(completion: @escaping (Result<DataWeather, Error>) -> Void) {
        let url = "https://api.spacexdata.com/v5/launches/latest"
        
        AF.request(url)
            .validate()
            .response { response in
                guard let data = response.data else {
                    if let error = response.error {
                        completion(.failure(NetworkError.noData))
                    }
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                guard let dataWeather = try? decoder.decode(DataWeather.self, from: data) else {
                    completion(.failure(NetworkError.invalidURL))
                    return
                }
                completion(.success(dataWeather))
            }
    }
}

