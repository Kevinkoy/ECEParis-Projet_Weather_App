//
//  API.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 20/03/2021.
//

import Foundation
// EQUIVALENT au #define en Swift
let APIKEY = "3f05cfb0aa99f7ec370e36e8be48404a"


struct OpenWeatherMap{
    var city : String
    var apiKey : String
    var url : String
    
    init()
    {
        city = "Paris"
        apiKey = APIKEY
        url = "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=imperial"
    }

    func getURL() -> String {
        return url
    }


}


