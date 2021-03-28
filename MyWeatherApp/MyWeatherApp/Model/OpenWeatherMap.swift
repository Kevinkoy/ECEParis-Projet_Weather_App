//
//  API.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 20/03/2021.
//

import Foundation


struct OpenWeatherMap{
    
    //MARK: - Properties
    let city : String
    let count : Int
    let apiKey : String
    let url : String
    
    //MARK: init
    init(_city: String, _cnt: Int, forecast: Bool)
    {
        city = _city
        count = _cnt
        apiKey = API_KEY
        if(forecast==true)
        {
        //5 Jours
        url = "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&cnt=\(count)appid=\(apiKey)"
        }
        else
        {
        url = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        }
    }

    
    //MARK: - getURL()
    func getURL() -> String {
        return url
    }

    

}


