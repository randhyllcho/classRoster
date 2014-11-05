//
//  ViewController.swift
//  classRosterApp
//
//  Created by RYAN CHRISTENSEN on 10/29/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var names = [person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        var myPerson = person()
        self.names.append(myPerson)
        myPerson.name = "Phil Coke"
        var anotherPerson = person()
        self.names.append(anotherPerson)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as UITableViewCell
        
        var personToDisplay = self.names[indexPath.row]
        cell.textLabel.text = personToDisplay.name
        return cell
    }
    
}

