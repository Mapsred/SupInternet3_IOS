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
class SWRequestManager {
    static let sharedInstance = SWRequestManager()
    
    private let host = "https://api.darksky.net/forecast"
    private let apiKey = "c0cfea97a09aa0c0d2a1bdba4ebbd8f4"
    
    internal let actualCoordinates: (latitude: String, longitude: String)
    
    private init() {
        actualCoordinates = (latitude: "é.2875920000023", longitude: "48.862725")
    }
    
    func fetchWeather() -> Void {
        var strRequest = "\(host)/\(apiKey)/"
        strRequest += "\(actualCoordinates.latitude)/\(actualCoordinates.longitude)/"
        
        Alamofire.request(.GET, strRequest).responseJSON {
            response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}