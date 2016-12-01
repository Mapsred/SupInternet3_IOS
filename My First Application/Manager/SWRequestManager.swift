//
//  SWRequestManager.swift
//  My First Application
//
//  Created by SUP'Internet 07 on 02/11/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import Foundation
import Alamofire

/// Request Manager to make HTTP Calls to zeather server

typealias WeatherObject = Dictionary<String, AnyObject>
typealias WeatherArray = Array<WeatherObject>

class SWRequestManager {
    static let sharedInstance = SWRequestManager()
    
    private let host = "https://api.darksky.net/forecast"
    private let apiKey = "c0cfea97a09aa0c0d2a1bdba4ebbd8f4"
    
    internal let actualCoordinates: (latitude: String, longitude: String)
    
    private init() {
        actualCoordinates = (latitude: "37.8267", longitude: "122.4233")
    }
    
    func fetchWeather(onSuccess success: (WeatherArray) -> Void, onError error: (String) -> Void) -> Void {
        var strRequest = "\(host)/\(apiKey)/"
        strRequest += "\(actualCoordinates.latitude),\(actualCoordinates.longitude)"
        Alamofire.request(.GET, strRequest).responseJSON { response in
            guard let JSON = response.result.value as? Dictionary<String, AnyObject>  else{
                error("Request Manager -> No data when fetching [\(strRequest)], or corrupted")
                return
            }
            
            guard let daily = JSON["daily"] as? Dictionary<String, AnyObject>,
                let data = daily["data"] as? WeatherArray else {
                error("Request Manager -> Can not map from \(strRequest)")
                return
            }
            
            success(data)
        }
    }
}