//
//  DetailViewController.swift
//  My First Application
//
//  Created by SUP'Internet 06 on 26/10/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var LabelDetail: UILabel!
    
    var weatherObj : Weather!
    
    static let identifier = "DetailWeatherCell"
   
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        print("Weather object : \(weatherObj)")
    }
}