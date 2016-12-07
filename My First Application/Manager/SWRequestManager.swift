//
//  SWRequestManager.swift
//  My First Application
//
//  Created by SUP'Internet 07 on 02/11/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

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
    
    func fetchWeather(onSuccess success: ([Weather]) -> Void, onError error: (String) -> Void) -> Void {
        var strRequest = "\(host)/\(apiKey)/"
        strRequest += "\(actualCoordinates.latitude),\(actualCoordinates.longitude)"
        strRequest += "?lang=fr&units=si"
        Alamofire.request(.GET, strRequest).responseArray("daily.data") { (response: Response<[Weather], NSError>) in
            guard let weatherResponse = response.result.value else {
                error("Request Manager -> No data when fetching [\(strRequest)], or corrupted")
                return
            }
                        
            success(weatherResponse)
        }
    }
}