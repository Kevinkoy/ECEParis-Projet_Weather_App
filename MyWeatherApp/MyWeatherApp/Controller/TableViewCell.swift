//
//  TableViewCell.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 22/03/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    //MARK: - Properties
    @IBOutlet weak var forecastTemp: UILabel!
    @IBOutlet weak var forecastDay: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK: - configureCell here !
    func configureCell(forecastData: ForecastWeather) {

            self.forecastDay.text = "\(forecastData.date.getFormattedDate(format: "EEEE ha"))"
            self.forecastTemp.text = "\(Int(forecastData.temp))"+"°"
            
        }

}

