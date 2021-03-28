//
//  TableViewController2.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 28/03/2021.
//
import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import CoreLocation

class Details: UITableViewController, CLLocationManagerDelegate {

    //MARK: - Properties
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Pression: UILabel!
    @IBOutlet weak var Humidité: UILabel!
    @IBOutlet weak var Lever: UILabel!
    @IBOutlet weak var Coucher: UILabel!
    @IBOutlet weak var Vitesse: UILabel!
    @IBOutlet weak var Visibilité: UILabel!
    
    
    //var lat = 11.344533
    //var lon = 104.33322
 
    var activityIndicator: NVActivityIndicatorView!
    let locationManager = CLLocationManager()

        
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // override code:
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
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let location = locations[0]
        //lat = location.coordinate.latitude
        //lon = location.coordinate.longitude
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=48.8534&lon=2.3488&appid=3f05cfb0aa99f7ec370e36e8be48404a&units=metric").responseJSON {
            response in
            //print(response)
            self.activityIndicator.stopAnimating()
            if let responseStr = response.result.value {
                let jsonResponse = JSON(responseStr)
                
                // Récupérations des données
                let jsonWeather = jsonResponse["weather"].array![0]
                let jsonSys = jsonResponse["sys"]
                self.Description.text = jsonWeather["description"].stringValue
                let jsonVis = jsonResponse["visibility"]
                let jsonWind = jsonResponse["wind"]
               
                self.Vitesse.text = "\(Int(jsonWind["speed"].doubleValue)) Km/h"
             
                self.Visibilité.text = "\(Int(jsonVis.doubleValue)/1000) Km"
         
                
                let jsonTemp = jsonResponse["main"]
                
                self.Pression.text = "\(Int(round(jsonTemp["pressure"].doubleValue))) hPa"
                self.Humidité.text = "\(Int(round(jsonTemp["humidity"].doubleValue))) %"
          
                
                
                let hl = jsonSys["sunrise"].doubleValue
                let h = Date(timeIntervalSince1970: hl)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "h a"
                
                self.Lever.text = dateFormatter.string(from: h)
                
                
                let hc = jsonSys["sunset"].doubleValue
                let C = Date(timeIntervalSince1970: hc)
                self.Coucher.text = dateFormatter.string(from: C)
            }
        }
        self.locationManager.stopUpdatingLocation()
    }
}

