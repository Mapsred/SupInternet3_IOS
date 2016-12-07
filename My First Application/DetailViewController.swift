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
    
    var weatherObj : Weather!
    
    static let identifier = "DetailWeatherCell"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //let backgroundUrl = "http://www.alarmemeteo.ch/typo3conf/ext/nmxdummy/resources/global/templates/img/header_background/wa-background2.jpg"
        //Alamofire.request(.GET, backgroundUrl).responseImage { response in
        //    self.view.backgroundColor = UIColor(patternImage: response.result.value!)
        //}
        
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
        summaryLabel.text = weatherObj.description
        minLabel.text = minTemp
        maxLabel.text = maxTemp
        
        
    }
}