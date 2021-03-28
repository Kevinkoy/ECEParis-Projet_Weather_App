//
//  ForecastWeather.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 22/03/2021.
//

import Foundation


class ForecastWeather {
    
    //MARK: - Properties
    private var _date: Date!
    private var _icon: String!
    private var _temp: Double!
    private var _tempMin: Double!
    private var _tempMax: Double!
    
    
    // Initialize
    var date: Date {
        if _date == nil {
            _date = Date()
        }
        return _date
    }
    

    var icon: String {
        if _icon == nil {
            _icon = ""
        }
        return _icon
    }

    var temp: Double {
        if _temp == nil {
            _temp = 0.0
        }
        return _temp
    }
    
    var tempMin: Double {
        if _tempMin == nil {
            _tempMin = 0.0
        }
        return _tempMin
    }
    var tempMax: Double {
        if _tempMax == nil {
            _tempMax = 0.0
        }
        return _tempMax
    }

    
    //MARK: - initialize
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        // Dictionary: KEY = String and VALUE = AnyObject
        //MARK: - Model for http://api.openweathermap.org/data/2.5/forecast/daily?q=Paris&appid=7c609f73c5df2dff2f32e3e3cc33cd23
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let dayTemp = temp["day"] as? Double {
                let rawValue = (dayTemp - 273).rounded()
                self._temp = rawValue
            }
            //max
            if let dayTempMax = temp["max"] as? Double {
                let rawValue2 = (dayTempMax - 273).rounded()
                self._tempMax = rawValue2
            }
            
            if let dayTempMin = temp["min"] as? Double {
                let rawValue3 = (dayTempMin - 273).rounded()
                self._tempMin = rawValue3
            }
        }
        
 
        //MARK: - Model for http://api.openweathermap.org/data/2.5/forecast?q=paris&appid=3f05cfb0aa99f7ec370e36e8be48404a
        if let temp = weatherDict["main"] as? Dictionary<String, AnyObject> {
            if let dayTemp = temp["temp"] as? Double {
                let rawValue = (dayTemp - 273.15).rounded()
                self._temp = rawValue
            }
        }
        
        //MARK: - icon
        if let Icon = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            for objet in Icon{
                self._icon = objet["icon"] as? String
                
            }

        }
        
        //MARK: - dt
        if let date = weatherDict["dt"] as? Double {
            //Le double est transformé en Date
            let rawDate = Date(timeIntervalSince1970: date)
            self._date = rawDate
        }
    }
    
}

