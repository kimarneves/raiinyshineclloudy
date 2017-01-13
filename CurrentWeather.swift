//
//  CurrentWeather.swift
//  raiinyshineclloudy
//
//  Created by Kimar Arakaki Neves on 2016-12-01.
//  Copyright © 2016 Kimar. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
    
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
   var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
    
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire download info
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name  = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"] {
                        self._weatherType = main.capitalized
                    }
                }
                
                if let mainInfo = dict["main"] as? Dictionary<String, Double> {
                    if let currentTemp = mainInfo["temp"] {
                        let tempInCelsius = Double(round(currentTemp - 273.15))
                        self._currentTemp = tempInCelsius
                    }
                }
            }
            
            completed()
        }
    }
}

