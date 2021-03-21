//
//  WeatherModel.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 20/03/2021.
//

import Foundation


/*
struct Weather: Codable {
    var temp: Double?
    var humidity: Double?
}
 
struct WeatherMain: Codable{
    let main: Weather
}
 
/*
func decodeJSONData(JSONData: Data){
    do{
        let weatherData = try? JSONDecoder().decode(WeatherMain.self, from: JSONData)
        if let weatherData = weatherData{
            let weather = weatherData.main
            print(weather.temp!)
            print(weather.humidity!)
        }
    }
}
 */
 
struct WeatherData: Decodable {
    let list: [List]
}
 
struct Main: Decodable {
    let temp: Float
    let temp_max: Float
    let temp_min: Float
    let feels_like: Float
    let humidity: Float
}
 
struct Weather2: Decodable {
    let main: String
    let description: String
    let icon: String
}
 
struct List: Decodable {
    let main: Main
    let weather: [Weather2]
}
 
/*
func decodeJSONForecast(JSONData: Data){
    let response = try! JSONDecoder().decode(WeatherData.self, from: JSONData)
    
    for i in response.list {
        print("Temp : \(i.main.temp)")
        print("Temp Max : \(i.main.temp_max)")
        print("Temp Min : \(i.main.temp_min)")
        print("Feels Like : \(i.main.feels_like)")
        print("Humidity : \(i.main.humidity)")
        for j in i.weather {
            print("Main : \(j.main)")
            print("Description : \(j.description)")
            print("Icon : \(j.icon)")
        }
    }
}
 
func pullJSONData(url: URL?, forecast: Bool){
    let task = URLSession.shared.dataTask(with: url!) { data, response, error in
        if let error = error {
            print("Error : \(error.localizedDescription)")
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("Error : HTTP Response Code Error")
            return
        }
        
        guard let data = data else {
            print("Error : No Response")
            return
        }
        
        if (!forecast){
            decodeJSONData(JSONData: data)
        } else {
            decodeJSONForecast(JSONData: data)
        }
    }
    task.resume()
}
 

let url = URL(string: OpenWeatherMap().getURL())
//pullJSONData(url: url, forecast: true)

*/
 
 */
