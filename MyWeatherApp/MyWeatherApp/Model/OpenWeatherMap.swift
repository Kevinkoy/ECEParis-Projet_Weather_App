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
    let apiKey : String
    let url : String
    
    //MARK: - init() par defaut Paris
    init()
    {
        city = "paris"
        apiKey = API_KEY
        url = "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)"
    }

    //MARK: - init("...of other Country/City)
    init(_city : String)
    {
        city = _city
        apiKey = API_KEY
        url = "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)"
    }
    
    //MARK: - getURL()
    func getURL() -> String {
        return url
    }


}


