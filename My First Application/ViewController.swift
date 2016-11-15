//
//  ViewController.swift
//  My First Application
//
//  Created by SUP'Internet 07 on 19/10/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var myLabel: UILabel!
    var resultWeather: WeatherArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SWRequestManager.sharedInstance.fetchWeather(onSuccess: { (result) in
            self.resultWeather = result
            self.reload()
        }) {
            (error) in print("Error => \(error)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///Reload content of View Controller
    func reload() {
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultWeather?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(RootWeatherCell.identifier) as? RootWeatherCell else {
            print("error")
            return UITableViewCell()
        }
        
        guard let objWeather = self.resultWeather?[indexPath.row],
        let summary = objWeather["summary"] as? String,
        let time = objWeather["time"] as? Int else {
            return cell
        }
        
        cell.backgroundColor = UIColor.redColor()
        cell.titleLabel.text = summary
        cell.titleLabel.font = UIFont(name:"Avenir", size:12)
        cell.dateLabel.text = "\(time)"
        cell.dateLabel.font = UIFont(name:"Avenir", size:12)

        
        return cell
    }
    
    
}

