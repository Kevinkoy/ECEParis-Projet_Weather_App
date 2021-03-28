//
//  TableViewCell.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 22/03/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var Day: UILabel!
    @IBOutlet weak var Icon: UIImageView!
    @IBOutlet weak var Tmax: UILabel!
    @IBOutlet weak var Tmin: UILabel!
    
    

    
    //MARK: - configureCell here !
    func configureCell(forecastData: ForecastWeather) {

            self.Day.text = "\(forecastData.date.getFormattedDate(format: "EEEE"))"
            self.Icon.image = UIImage(named: "\(forecastData.icon)")
            self.Tmax.text = "\(Int(forecastData.tempMax))"
            self.Tmin.text = "\(Int(forecastData.tempMin))"
            
        }
    
}




