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
    var iconName: String = "sun"
    var temperatureMax: Double!
    var temperatureMin: Double!
    
    static var dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "fr_FR")
        formatter.dateFormat = "EEEE d MMM"
        
        return formatter
    }()
    
    var formatedDate: String {
        let dateA = NSDate(timeIntervalSinceReferenceDate: date)
        return Weather.dateFormatter.stringFromDate(dateA)
    }

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
    
    func getDate() -> String {
        return self.formatedDate
    }
    
    func getImageLink() ->  String{
        let dictionnaryWeather = [
            "rain" : "http://openweathermap.org/img/w/10d.png",
            "sun": "http://openweathermap.org/img/w/01d.png",
            "partly-cloudy-night": "http://openweathermap.org/img/w/10n.png",
            "clear-night": "http://openweathermap.org/img/w/01n.png"
        ]
        
        return  (dictionnaryWeather[iconName] == nil ? dictionnaryWeather["sun"] : dictionnaryWeather[iconName])!
    }
}