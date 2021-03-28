//
//  CollectionViewCell.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 26/03/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "collectionCell"
    
    ///Mark: - Properties
    @IBOutlet weak var Hours: UILabel!
    @IBOutlet weak var Temp: UILabel!
    @IBOutlet weak var Icon: UIImageView!
    
    //MARK: - configureCell here !
    func configureCell(forecastData: ForecastWeather) {
        // Déclarer un DateFormatter()
        let dateformat = DateFormatter()
        
        // Définir le format de la date
        //dateformat.dateFormat = "ha" //  ha : Heure avec AM / PM 
        dateformat.dateFormat = "HH" // HH : Heure format 24h
        
        // Configurer les valeurs
        self.Hours.text = dateformat.string(from: forecastData.date) + " h"
        self.Icon.image = UIImage(named: "\(forecastData.icon)")
        self.Temp.text = "\(Int(forecastData.temp))"+"°"
        }
}


