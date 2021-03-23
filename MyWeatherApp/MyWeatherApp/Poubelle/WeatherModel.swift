//
//  Weather.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 20/03/2021.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherModel = try? newJSONDecoder().decode(WeatherModel.self, from: jsonData)

import Foundation
import Alamofire


// MARK: - WeatherModel
struct WeatherModel: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
    
    

}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: MainEnum
    let weatherDescription: Description
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}





/*
struct WeatherModel : Decodable{
    var cod : Double
    var message : Double
    var cnt : Double
    var list : [List]
    var city : City
}

struct List : Decodable{
    var dt : Double
    var main : Main
    var weather : [Weather]
    var clouds : Clouds
    var wind : Wind
    var visibility : Double
    var pop : Double
    var sys : Sys
    var dt_txt : String
}

struct Main : Decodable{
    var temp : Double
    var feels_like : Double
    var temp_min : Double
    var temp_max : Double
    var pressure : Double
    var sea_level : Double
    var grnd_level : Double
    var humidity : Double
    var temp_kf : Double
}

struct Weather : Decodable{
    var id : String
    var main : String
    var description : String
    var icon : String
}

struct Clouds : Decodable{
    var all : Double
}

struct Wind : Decodable{
    var speed : Double
    var deg : Double
}

struct Sys : Decodable{
    var pod : String
}

///

struct City : Decodable{
    var id : String
    var name : String
    var coord : Coord
    var country : String
    var population : Double
    var timezone : Double
    var sunrise : Double
    var sunset : Double
}

struct Coord : Decodable{
    var lat : Double
    var lon : Double
}
*/
//let url : String = OpenWeatherMap().getURL()

/*
func getData(from url : String)
{
    
    let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, reponse, error in
    guard let data = data, error == nil else{
        print("Something went wrong")
        return
    }
        // Have data
        var result : WeatherModel?
        do{
            result = try JSONDecoder().decode(WeatherModel.self, from: data)
        }
        catch{
            print("failed to convert \(error.localizedDescription)")
        }
        guard let json = result else{
            return
        }
        print(json.list.count)
    })
    task.resume()
}
 */
 
 



 
