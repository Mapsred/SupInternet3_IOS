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
    var iconName: String!
    var temperatureMax: Double!
    var temperatureMin: Double!
    var sunriseTime: Double!
    var sunsetTime: Double!
    var temperatureMinTime: Double!
    var temperatureMaxTime: Double!
    
    
    static var dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "fr_FR")
        formatter.dateFormat = "EEEE d MMM"
        
        return formatter
    }()
    
    static var timeFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "fr_FR")
        formatter.dateFormat = "HH:mm"

        return formatter
    }()
    
    var formatedDate: String {
        let dateA = NSDate(timeIntervalSinceReferenceDate: date)
        return Weather.dateFormatter.stringFromDate(dateA)
    }
    
    func getFormatedTime(date: Double) -> String {
        let dateA = NSDate(timeIntervalSinceReferenceDate: date)

        return Weather.timeFormatter.stringFromDate(dateA)
    }

    required init?(_ map: Map) {
        guard
            (map.JSONDictionary["time"] as? Int) != nil &&
            (map.JSONDictionary["temperatureMin"] as? Double) != nil &&
            (map.JSONDictionary["temperatureMax"] as? Double) != nil &&
            (map.JSONDictionary["summary"] as? String) != nil &&
            (map.JSONDictionary["icon"] as? String) != nil &&
            (map.JSONDictionary["sunriseTime"] as? Double) != nil &&
            (map.JSONDictionary["sunsetTime"] as? Double) != nil &&
            (map.JSONDictionary["temperatureMinTime"] as? Double) != nil &&
            (map.JSONDictionary["temperatureMaxTime"] as? Double) != nil
            else {
            return nil
        }
        
    }
    
    func mapping(map: Map) {
        date <- map["time"]
        description <- map["summary"]
        iconName <- map["icon"]
        temperatureMin <- map["temperatureMin"]
        temperatureMax <- map["temperatureMax"]
        sunriseTime <- map["sunriseTime"]
        sunsetTime <- map["sunsetTime"]
        temperatureMinTime <- map["temperatureMinTime"]
        temperatureMaxTime <- map["temperatureMaxTime"]
    }
    
    func getDate() -> String {
        return self.formatedDate
    }
    
    func getWeatherIcon() -> String {
        return "https://cdn.mindgame.ovh/weather/\(iconName).png"
    }
}