//
//  Weather.swift
//  My First Application
//
//  Created by SUP'Internet 14 on 06/12/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {
    var date: Double!
    var description: String?
    var iconName: String = "icon-default"
    var temperatureMax: Double!
    var temperatureMin: Double!

    required init?(_ map: Map) {
        guard ((map.JSONDictionary["time"] as? Int) != nil) && ((map.JSONDictionary["temperatureMin"] as? Double) != nil)
            && (map.JSONDictionary["temperatureMax"] as? Double) != nil else {
            return nil
        }
        
    }
    
    func mapping(map: Map) {
        date <- map["time"]
        description <- map["summary"]
        iconName <- map["icon"]
        temperatureMin <- map["temperatureMin"]
        temperatureMax <- map["temperatureMax"]
    }
}