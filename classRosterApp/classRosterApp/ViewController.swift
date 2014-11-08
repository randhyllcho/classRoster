//
//  ViewController.swift
//  classRosterApp
//
//  Created by RYAN CHRISTENSEN on 10/29/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var firstNames = [person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Bullpen"
        var charlie = person(name: "Charlie", last: "Furbush", Starter: true)
        charlie.fullName()
        var tom = person(name: "Tom", last: "Wilhelmsen", Starter: true)
        tom.fullName()
        var lucas = person(name: "Lucas", last: "Luetge", Starter: false)
        lucas.fullName()
        self.firstNames = [charlie, tom ,lucas]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.firstNames.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellFirst = tableView.dequeueReusableCellWithIdentifier("FIRST_NAME_CELL", forIndexPath: indexPath) as  UITableViewCell
        
        var personToDisplay = self.firstNames[indexPath.row]
        cellFirst.textLabel.text = personToDisplay.fullName()
        
        return cellFirst
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_FULL_NAME" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var firstNameToPass = self.firstNames[selectedIndexPath!.row]
            detailViewController.relieverFirst = firstNameToPass
        }
    }
}

