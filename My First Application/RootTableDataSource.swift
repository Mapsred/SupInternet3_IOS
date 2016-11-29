//
//  RootTableDataSource.swift
//  My First Application
//
//  Created by SUP'Internet 07 on 15/11/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire


class RootTableDataSource: NSObject, UITableViewDataSource {
    
    lazy var dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "fr_FR")
        formatter.dateFormat = "EEEE d MMM"
        
        return formatter
    }()
    
    
    var resultWeather: WeatherArray?
    
    // Fetch New Weather
    func updateWeather(completion: () -> Void!) -> AnyObject! {
        SWRequestManager.sharedInstance.fetchWeather(onSuccess: { [weak self](result) in
            self?.resultWeather = result
            completion()
        }) { (error) in
            completion()
            print("Error => \(error)")
        }
        
        return nil
    }

    // Implementation of UiTableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultWeather?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(RootWeatherCell.identifier) as? RootWeatherCell else {
            print("error")
            return UITableViewCell()
        }
        
        guard let objWeather = self.resultWeather?[indexPath.row] else {
            return cell
        }
        
        self.configure(tableViewCell: cell, withObjectWeather: objWeather)
        print("Cell for Row")
        
        return cell
    }
    
    func configure(tableViewCell cell: RootWeatherCell, withObjectWeather objWeather: [String: AnyObject]) {
        guard let summary = objWeather["summary"] as? String, let time = objWeather["time"] as? Double else {
            return
        }
        
        cell.summaryLabel.text = summary
        cell.summaryLabel.font = UIFont(name:"Avenir", size:12)
        
        let date = NSDate(timeIntervalSinceReferenceDate: time)
        let strDateFormated = self.dateFormatter.stringFromDate(date)
        
        cell.dateLabel.text = strDateFormated
        cell.dateLabel.font = UIFont(name:"Avenir", size:12)
        
        Alamofire.request(.GET, "https://maxcdn.icons8.com/iOS7/PNG/25/Network/shared-25.png").responseImage {
            response in
                if let image = response.result.value {
                    cell.imageLabel.image = image
                }else {
                    debugPrint(response)
                }
        }
        
        

    }

}