//
//  DetailViewController.swift
//  My First Application
//
//  Created by SUP'Internet 06 on 26/10/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var sunrise: UIImageView!
    @IBOutlet weak var sunset: UIImageView!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    var weatherObj : Weather!
    var url: String = "https://cdn.mindgame.ovh/weather/"
    
    static let identifier = "DetailWeatherCell"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "\(url)background/main-background.jpg").responseImage {
            response in if let image = response.result.value {
                self.view.backgroundColor = UIColor(patternImage: image)
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        return
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let minTemp = String(Int(weatherObj.temperatureMin))
        let maxTemp = String(Int(weatherObj.temperatureMax))
        progressBar.transform = CGAffineTransformScale(progressBar.transform, 1, 10)
        dateLabel.text = weatherObj.getDate()
        infoLabel.text = "Températures entre \(minTemp) et \(maxTemp) degrés"
        summaryLabel.numberOfLines = 0
        summaryLabel.text = weatherObj.description
        minLabel.text = "\(minTemp)°"
        maxLabel.text = "\(maxTemp)°"
        detailLabel.text = "\(minTemp)°  \(weatherObj.getFormatedTime(weatherObj.temperatureMinTime)) -> \t" +
        "\(maxTemp)°  \(weatherObj.getFormatedTime(weatherObj.temperatureMaxTime))"
        detailLabel.font = UIFont(name:"Avenir", size:14)
        
        Alamofire.request(.GET, "\(url)sunrise.png").responseImage {
            response in if let image = response.result.value {
                self.sunrise.image = image
            }
        }
        
        Alamofire.request(.GET, "\(url)sunset.png").responseImage {
            response in if let image = response.result.value {
                self.sunset.image = image
            }
        }

        sunriseLabel.text = weatherObj.getFormatedTime(weatherObj.sunsetTime)
        sunsetLabel.text = weatherObj.getFormatedTime(weatherObj.sunriseTime)

        
    }
}