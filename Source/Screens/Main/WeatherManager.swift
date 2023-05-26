//
//  MainModel.swift
//  WeatherTest
//
//  Created by User on 26/05/23.
//

import Foundation
import CoreData
struct Weather: Codable {
    
    let location: Location?
    let current: Current?
    let days: Forecast?
    
    private enum CodingKeys: String, CodingKey {
        case location
        case current
        case days = "forecast"
        
    }
}

struct Location: Codable {
    let name: String?
    let region: String?
    let country: String?
    let localtime: String?
}

struct Condition: Codable {
    let icon: String?
}

struct Current: Codable {
    let temp_c: Float?
    let temp_f: Float?
    let is_day: Int?
    let condition: Condition?
    let wind_mph: Float?
    let wind_degree: Float?
    let wind_dir: String?
    let pressure_mb: Float?
    let precip_mm: Float?
    let humidity: Float?
    let cloud: Int?
    let feelslike_c: Float?
    let feelslike_f: Float?
    let uv: Int?
}

struct Forecast: Codable {
    let forecastday : [Forecastday]
}

protocol ReloadProtocol {
    func reloadData()
}

class WeatherClass: NSDiscardableContent{
    // Our counter variable
        var accessCounter = true
    
    func beginContentAccess() -> Bool {
        if weather != nil {
                    accessCounter = true
                } else {
                    accessCounter = false
                }
                return accessCounter
    }
    
    func endContentAccess() {
        accessCounter = false
    }
    
    func discardContentIfPossible() {
        weather = nil
    }
    
    func isContentDiscarded() -> Bool {
        return weather == nil
    }
    
    var weather: Weather?
    init(weather w: Weather) {
        weather = w
    }
}

class WeatherManager {
    
    var weather: Weather?{
        didSet{
            self.delegate?.reloadData()
        }
    }
    var delegate: ReloadProtocol?
    
    init(delegate d: ReloadProtocol) {
        delegate = d
        
    }
    
    
    func refreshWeather() {
        
        if let data = DataManager.shared.getCacheData(key: "weather").first?.data {
            do {
            let decoder = JSONDecoder()
            let weather = try decoder.decode(Weather.self, from: data)
                print("FROM CACHE")
                self.weather = weather
            } catch let err {
                print("Err", err)
            }
        } else {
            print("NOT CACHE")
        }
        guard let getUrl = URL(string: "https://api.weatherapi.com/v1/forecast.json?q=Tashkent&days=10&lang=ru&key=227c381e4e00449a942123720232505") else { return }
        URLSession.shared.dataTask(with: getUrl) { (data, response
                                                    , error) in
            guard let data = data else { return }
            do {
                DataManager.shared.saveCacheData(key: "weather", data: data)
                let decoder = JSONDecoder()
                let weather = try decoder.decode(Weather.self, from: data)
                
                self.weather = weather
            } catch let err {
                print("Err", err)
            }
        }.resume()
    }
    

}


