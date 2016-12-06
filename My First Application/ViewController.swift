//
//  ViewController.swift
//  My First Application
//
//  Created by SUP'Internet 07 on 19/10/2016.
//  Copyright © 2016 François Mathieu. All rights reserved.
//

import UIKit
import GearRefreshControl

class ViewController: UITableViewController {

    var weatherDataSource : RootTableDataSource! = nil
    var gearRefreshControl: GearRefreshControl!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gearRefreshControl = GearRefreshControl(frame: self.view.bounds)
        gearRefreshControl.addTarget(self, action: #selector(ViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = gearRefreshControl
        
        self.weatherDataSource = RootTableDataSource()
        self.tableView.dataSource = self.weatherDataSource
        self.weatherDataSource.updateWeather {
            [weak self]_ in
            self?.reload()
        }
    }
    
    func refresh(){
        self.gearRefreshControl.endRefreshing()
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        gearRefreshControl.scrollViewDidScroll(scrollView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///Reload content of View Controller
    func reload() {
        self.tableView.reloadData()
    }
    
    @IBAction func userTapped() {        
        performSegueWithIdentifier("ShowDetailSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetailSegue"{
            guard let selectedIndex = self.tableView.indexPathForSelectedRow,
            let object = self.weatherDataSource.getWeatherObject(selectedIndex.row) as? Weather else {return}
            
            guard let DetailViewController = segue.destinationViewController as? DetailViewController else {return}
            DetailViewController.weatherObj = object
        }
    }
    
    
}

