//
//  NetworkManager.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 06.11.2023.
//

import Foundation

//MARK: - Enums
enum NetworkError: Error {
    case noData, invalidURL, decodingError
}

enum API: String {
    case weatherURL = "https://api.weather.yandex.ru/v2/informers?lat=55.7&lon=37.6"
}

//MARK: - NetworkManager
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
//    func fetchForecast() async throws -> DataWeather {
//        guard let url = URL(string: API.weatherURL.rawValue) else {
//            throw NetworkError.invalidURL
//        }
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        guard let forecast = try? decoder.decode(DataWeather.self, from: data) else {
//            throw NetworkError.decodingError
//        }
//        return forecast
//    }
    
    func fetchForecast(comletion: @escaping(Result<DataWeather, NetworkError>) -> Void) {
        guard let url = URL(string: API.weatherURL.rawValue) else {
            comletion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                comletion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
                }
            
            let decoder = JSONDecoder()
            
            do {
                let dataModel = try decoder.decode(DataWeather.self, from: data)
                DispatchQueue.main.async {
                    comletion(.success(dataModel))
                }
            } catch {
                comletion(.failure(.decodingError))
            }
        }.resume()
    }
}

