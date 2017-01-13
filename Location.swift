//
//  Location.swift
//  raiinyshineclloudy
//
//  Created by Kimar Arakaki Neves on 2016-12-04.
//  Copyright © 2016 Kimar. All rights reserved.
//

import CoreLocation

class Location {
    static var phoneCoordinates = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
