//
//  File.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 22/03/2021.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import CoreLocation

class TableViewController: UITableViewController, CLLocationManagerDelegate {

    //MARK: - Properties
    @IBOutlet weak var condition_Label: UILabel!
    @IBOutlet weak var day_Label: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var location_Label: UILabel!
    @IBOutlet weak var temperature_Label: UILabel!

  
    
    // Geolocalisation
    /*
    var lat = 11.344533
    var lon = 104.33322
    var activityIndicator: NVActivityIndicatorView!
    let locationManager = CLLocationManager()
    */
    
    //var forecastWeather: ForecastWeather!
    var forecastArray = [ForecastWeather]()

    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let indicatorSize: CGFloat = 70
        let indicatorFrame = CGRect(x: (view.frame.width-indicatorSize)/2, y: (view.frame.height-indicatorSize)/2, width: indicatorSize, height: indicatorSize)
        
        activityIndicator = NVActivityIndicatorView(frame: indicatorFrame, type: .lineScale, color: UIColor.white, padding: 20.0)
        activityIndicator.backgroundColor = UIColor.black
        view.addSubview(activityIndicator)
        
        locationManager.requestWhenInUseAuthorization()
        
        activityIndicator.startAnimating()
        if(CLLocationManager.locationServicesEnabled()){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        */

        downloadForecastWeather()
    }
    
    
    //MARK: - locationManager(...)
    /*
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        lat = location.coordinate.latitude
        lon = location.coordinate.longitude
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=48.8534&lon=2.3488&appid=6ca6a7fb0278430cf386f8a98e9d3cce&units=metric").responseJSON {
            response in
            //print(response)
            self.activityIndicator.stopAnimating()
            if let responseStr = response.result.value {
                let jsonResponse = JSON(responseStr)
                let jsonWeather = jsonResponse["weather"].array![0]
                let jsonTemp = jsonResponse["main"]
                let iconName = jsonWeather["icon"].stringValue
                
                self.location_Label.text = jsonResponse["name"].stringValue
                self.ImageView.image = UIImage(named: iconName)
                self.condition_Label.text = jsonWeather["main"].stringValue
                self.temperature_Label.text = "\(Int(round(jsonTemp["temp"].doubleValue)))"
                
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE"
                
                self.day_Label.text = dateFormatter.string(from: date)
                //pour le jour et la nuit
            }
        }
        self.locationManager.stopUpdatingLocation()
    }
  */

    
    //MARK: - downloadForecastWeather()
    func downloadForecastWeather() {
        Alamofire.request(OpenWeatherMap(_city: "paris").getURL()).responseJSON { (response) in
                //print(response)
                let result = response.result
            
                if let dictionary = result.value as? Dictionary<String, AnyObject> {
                    
                    if let list = dictionary["list"] as? [Dictionary<String, AnyObject>] {
                        
                        for item in list {
                            
                            let forecast = ForecastWeather(weatherDict: item)
                            self.forecastArray.append(forecast)
                        }
                        self.forecastArray.remove(at: 0)
                        
                        // Rechargement des données
                        self.tableView.reloadData()
                    }
                }
 
            }
        }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.configureCell(forecastData: forecastArray[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }
    

}

