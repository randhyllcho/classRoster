//
//  ViewController.swift
//  practiceTable3
//
//  Created by RYAN CHRISTENSEN on 12/9/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var cityTeam = [Team]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var newYork = Team(city: "New York", name: "Yankees")
        var sanFran = Team(city: "San Fransisco", name: "Giants")
        var oakland = Team(city: "Oakland", name: "Athletics")
        
        self.cityTeam = [newYork, sanFran, oakland]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TEAM_CELL", forIndexPath: indexPath) as TeamTableViewCell
        
        var cityToDisplay = self.cityTeam[indexPath.row]
        cell.cityLabel.text = cityToDisplay.city
        cell.nameLabel.text = cityToDisplay.teamName
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityTeam.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_TEAM"{
            let teamVC = segue.destinationViewController as TeamViewController
            let selectedIndex = self.tableView.indexPathForSelectedRow()
            teamVC.selectedTeam = self.cityTeam[selectedIndex!.row]
    }
   }

}

