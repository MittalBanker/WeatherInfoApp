//
//  WeatherApi.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 29/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import CoreLocation

typealias JSONPayload = [String : Any]

// this is what we provide as a result to the caller who requests weather from the WeatherController
typealias WeatherTuple = (temperature: Float, description: String, humidity: Float, wind: Float)

enum WeatherError: Error {
    case requestFailed
    case noData
    case serializationFailed
    case parsingFailed
}

// this is very simple and just has the temp as a Float, and description as a String,
// you might want to replace this with a more robust result
enum WeatherResult {
    case success(WeatherTuple)
    case failure(WeatherError)
}

class WeatherApi {
    static let shared = WeatherApi()

    let session = URLSession.shared
    // FIXME: you must replace this with your OpenWeather API key (APPID), see https://openweathermap.org/appid
    fileprivate let APIKey = "c6e381d8c7ff98f0fee43775817cf6ad"
    fileprivate let baseURLPath = "http://api.openweathermap.org/data/2.5/weather?"

    // singleton should not be initialized elsewhere
    fileprivate init() {}

    typealias WeatherCompletion = (WeatherResult) -> Void
    func weatherURL(for coordinate: CLLocationCoordinate2D) -> URL {
        let unit = Utils.getDefaults(key: GlobalConstants.unit) ?? "matric"
        let URLPath = baseURLPath + "lat=\(coordinate.latitude)" + "&lon=\(coordinate.longitude)" + "&units=imperial" + "&APPID=\(APIKey)"
        return URL(string: URLPath)!
    }

    func weather(coordinate: CLLocationCoordinate2D, completion: @escaping WeatherCompletion) {
        session.dataTask(with: weatherURL(for: coordinate)) { data, URLResponse, requestError in
            guard let data = data else {
                if let _ = requestError {
                    completion(.failure(.requestFailed))
                } else {
                    print("WeatherController: data is nil, but there is no error!")
                }

                return
            }

            do {
                guard let JSON = try JSONSerialization.jsonObject(with: data, options: []) as? JSONPayload else {
                    completion(.failure(.serializationFailed))
                    return
                }

                guard let weatherResult = self.parse(JSON) else {
                    completion(.failure(.parsingFailed))
                    return
                }

                completion(.success(weatherResult))
            } catch {
                completion(.failure(.serializationFailed))
            }
            }.resume()
    }

    func parse(_ payload: JSONPayload) -> WeatherTuple? {
        guard let temp = (payload["main"] as? JSONPayload)?["temp"] as? Float else { return nil }
        guard let humidity = (payload["main"] as? JSONPayload)?["humidity"] as? Float else { return nil }
        guard let wind = (payload["wind"] as? JSONPayload)?["speed"] as? Float else { return nil }
        // man JSON parsing in Swift is ug, i should give SwiftyJSON a try
        guard let description = ((payload["weather"]) as? [JSONPayload])?.first?["description"] as? String else { return nil }

        return (temp, description, humidity, wind)
    }
}
