//
//  Forecast.swift
//  raiinyshineclloudy
//
//  Created by Kimar Arakaki Neves on 2016-12-04.
//  Copyright © 2016 Kimar. All rights reserved.
//

import UIKit

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String{
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String{
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String{
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String{
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(forecastDict: Dictionary<String, AnyObject>){
        if let temp = forecastDict["temp"] as? Dictionary<String, Double> {
            if let minTemp = temp["min"] {
                let tempInCelsius = Double(round(minTemp - 273.15))
                self._lowTemp = "\(tempInCelsius)"
            }
            
            if let maxTemp = temp["max"] {
                let tempInCelsius = Double(round(maxTemp - 273.15))
                self._highTemp = "\(tempInCelsius)"
            }
        }
        
        if let weather = forecastDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = forecastDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        
    }
}
