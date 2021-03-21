//
//  Weather.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 20/03/2021.
//

import Foundation


struct WeatherModel : Codable{
    var cod : Double?
    var message : Double?
    var cnt : Double?
    var list : [List]?
    var city : City?
    
}

struct List : Codable{
    var dt : Double?
    var main : Main?
    var weather : [Weather]?
    var clouds : Clouds?
    var wind : Wind?
    var visibility : Double?
    var pop : Double?
    var sys : Sys?
    var dt_txt : String?
}

struct Main : Codable{
    var temp : Double?
    var feels_like : Double?
    var temp_min : Double?
    var temp_max : Double?
    var pressure : Double?
    var sea_level : Double?
    var grnd_level : Double?
    var humidity : Double?
    var temp_kf : Double?
}

struct Weather : Codable{
    var id : Int?
    var main : String?
    var description : String?
    var icon : String?
}

struct Clouds : Codable{
    var all : Double?
}

struct Wind : Codable{
    var speed : Double?
    var deg : Double?
}

struct Sys : Codable{
    var pod : String?
}

///

struct City : Codable{
    var id : Int?
    var name : String?
    var coord : Coord?
    var country : String?
    var population : Double?
    var timezone : Double?
    var sunrise : Double?
    var sunset : Double?
}

struct Coord : Codable{
    var lat : Double?
    var lon : Double?
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
    var id : Int
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
    var id : Int
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
 



 
