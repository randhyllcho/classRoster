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
    var lastNames = [personLast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        var charlie = person()
        charlie.name = "Charlie"
        var tom = person()
        tom.name = "Tom"
        var lucas = person()
        lucas.name = "Lucas"
        self.firstNames = [charlie, tom ,lucas]
        
        var furbush = personLast()
        furbush.lastName = "Furbush"
        var wilhelmsen = personLast()
        wilhelmsen.lastName = "Wilhelmsen"
        var luetge = personLast()
        luetge.lastName = "Luetge"
        self.lastNames = [furbush, wilhelmsen, luetge]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.firstNames.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellFirst = tableView.dequeueReusableCellWithIdentifier("FIRST_NAME_CELL", forIndexPath: indexPath) as  UITableViewCell
        
        var personToDisplay = self.firstNames[indexPath.row]
        cellFirst.textLabel.text = personToDisplay.name
        
        return cellFirst
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_FULL_NAME" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var firstNameToPass = self.firstNames[selectedIndexPath!.row]
            var lastNameToPass = self.lastNames[selectedIndexPath!.row]
            detailViewController.selectedPerson = firstNameToPass
            detailViewController.relieverLast = lastNameToPass
            
        }
    }
}

