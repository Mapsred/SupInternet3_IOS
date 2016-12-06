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
    @IBOutlet weak var LabelDetail: UILabel!
    
    var weatherObj : Weather!
    
    static let identifier = "DetailWeatherCell"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundUrl = "http://www.alarmemeteo.ch/typo3conf/ext/nmxdummy/resources/global/templates/img/header_background/wa-background2.jpg"
        Alamofire.request(.GET, backgroundUrl).responseImage { response in
            self.view.backgroundColor = UIColor(patternImage: response.result.value!)
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
        //let desc: String = weatherObj.description!
        if let date: String? = weatherObj.getDate() {
            //self.LabelDetail.text = date
        }
    }
}