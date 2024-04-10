//
//  NetworkManager.swift
//  MyWeather
//
//  Created by Елизавета Медведева on 06.11.2023.
//

import Foundation
import Alamofire

//MARK: - Enums
enum NetworkError: Error {
    case noData, invalidURL, decodingError
}

//MARK: - NetworkManager
final class NetworkManager {

    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchForecast(completion: @escaping(Result<DataWeather, Error>) -> Void) {
        
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

