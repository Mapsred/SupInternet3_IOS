//
//  SWRequestManager.swift
//  My First Application
//
//  Created by SUP'Internet 07 on 02/11/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import Foundation
import Alamofire


class SWRequestManager {
    func fetchWeather() -> Void {
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
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