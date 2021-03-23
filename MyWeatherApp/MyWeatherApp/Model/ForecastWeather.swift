//
//  ForecastWeather.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 22/03/2021.
//

import Foundation

class ForecastWeather {
    
    //MARK: - Properties
    private var _date: Date! //String
    private var _temp: Double!
    
    var date: Date { //String
        if _date == nil {
            _date = Date() //""
        }
        return _date
    }
    
    
    var temp: Double {
        if _temp == nil {
            _temp = 0.0
        }
        return _temp
    }
    
        
    

    
    //MARK: - init
    /// - Parameter weatherDict: We are taking Dictionary of type String and AnyObject.
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        /// temperature
        if let temp = weatherDict["main"] as? Dictionary<String, AnyObject> {
            
            if let dayTemp = temp["temp"] as? Double {
                let rawValue = (dayTemp - 273.15)
                //let rawValue = (dayTemp).rounded()
                self._temp = rawValue
            }
            
        }
        
        /// date
        if let date = weatherDict["dt"] as? Double {
            
            let rawDate = Date(timeIntervalSince1970: date)
                        //let dateFormatter = DateFormatter()
                        //dateFormatter.dateStyle = .medium
                        
            //self._date = "\(rawDate)"
            self._date = rawDate
            
            
        }
        
    }
    
}
