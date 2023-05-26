//
//  DetailModel.swift
//  WeatherTest
//
//  Created by User on 26/05/23.
//

import Foundation
struct Forecastday: Codable {
    let date: String?
    let day: Day?
    let astro: Astro?
    let hour: [Hour]
}


struct Day: Codable {
    let maxtemp_c : Float?
    let maxtemp_f: Float?
    let mintemp_c: Float?
    let mintemp_f: Float?
    let avgtemp_c: Float
    let avgtemp_f: Float?
    let maxwind_mph: Float?
    let maxwind_kph: Float?
    let totalprecip_mm: Float?
    let totalprecip_in: Float?
    let totalsnow_cm: Float?
    let avgvis_km: Float?
    let avgvis_miles: Float?
    let avghumidity: Float?
    let daily_will_it_rain: Int?
    let daily_chance_of_rain: Float?
    let daily_will_it_snow: Int?
    let daily_chance_of_snow: Float?
    let condition: Condition?
    let uv: Int?
}


struct Astro: Codable {
    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let moon_phase: String?
    let moon_illumination: String?
}

struct Hour: Codable {
    let time: String?
    let temp_c: Float?
    let temp_f: Float?
    let is_day: Int?
    let condition: Condition?
    let wind_mph: Float?
    let wind_kph: Float?
    let wind_degree: Float?
    let wind_dir: String?
    let pressure_mb: Float?
    let pressure_in: Float?
    let precip_mm: Float?
    let precip_in: Float?
    let humidity: Float?
    let cloud: Int?
    let feelslike_c: Float?
    let feelslike_f: Float?
    let windchill_c: Float?
    let windchill_f: Float?
    let heatindex_c: Float?
    let heatindex_f: Float?
    let dewpoint_c: Float?
    let dewpoint_f: Float?
    let will_it_rain: Int?
    let chance_of_rain: Float?
    let will_it_snow: Int?
    let chance_of_snow: Float?
    let uv: Int?
}
