//
//  Constants.swift
//  raiinyshineclloudy
//
//  Created by Kimar Arakaki Neves on 2016-11-30.
//  Copyright "© 2016 Kimar. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let MSG_PARAMS = "&cnt=7&mode=json"
let APP_ID = "&appid="
let API_KEY = "6358d8feb4bbba79448f439e34a22ed4"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)weather?\(LATITUDE)\(Location.phoneCoordinates.latitude!)\(LONGITUDE)\(Location.phoneCoordinates.longitude!)\(APP_ID)\(API_KEY)"

let FORECAST_URL = "\(BASE_URL)forecast/daily?\(LATITUDE)\(Location.phoneCoordinates.latitude!)\(LONGITUDE)\(Location.phoneCoordinates.longitude!)\(MSG_PARAMS)\(APP_ID)\(API_KEY)"
