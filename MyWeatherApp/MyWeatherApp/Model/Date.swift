//
//  Date.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 23/03/2021.
//

import Foundation

//MARK: - extension Date
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
