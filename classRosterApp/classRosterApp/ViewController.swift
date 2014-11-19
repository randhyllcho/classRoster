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
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadFromPlist()
        
        self.title = "Class Roster"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    
    }
    
    func loadFromPlist(){
        let plistURL = NSBundle.mainBundle().pathForResource("roster", ofType:"plist")
        
        let plistArray = NSArray(contentsOfFile: plistURL!)
        for object in plistArray! {
            if let personDictionary = object as? NSDictionary {
                let firstName = personDictionary["First Name"] as String
                let lastName = personDictionary["Last Name"] as String
                var person = Person(name: firstName, last: lastName)
                self.people.append(person)
            }
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellFirst = tableView.dequeueReusableCellWithIdentifier("FIRST_NAME_CELL", forIndexPath: indexPath) as PersonTableViewCell
        
        var personToDisplay = self.people[indexPath.row]
        cellFirst.nameLabel.text = personToDisplay.firstName
        cellFirst.nameLabel.font = UIFont(name: "Didot", size: 20.0)
        cellFirst.titleLabel.text = personToDisplay.lastName
        cellFirst.titleLabel.font = UIFont(name: "Didot", size: 15.0)
        return cellFirst
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_FULL_NAME" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var firstNameToPass = self.people[selectedIndexPath!.row]
            detailViewController.reliever = firstNameToPass
            
        }
    }
}

