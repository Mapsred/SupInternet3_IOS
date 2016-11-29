//
//  RootWeatherCell.swift
//  My First Application
//
//  Created by SUP'Internet 07 on 02/11/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import Foundation
import UIKit


class RootWeatherCell: UITableViewCell {
    
    static let identifier = "RootWeatherCellIdentifier"
    
    @IBOutlet var summaryLabel: UILabel!

    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UIImageView!
}