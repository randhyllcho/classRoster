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
    
    @IBOutlet weak var personCellImage: UIImageView!
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if let peopleFromArchive = self.loadFromArchive() as [Person]? {
            self.people = peopleFromArchive
        } else {
            self.loadFromPlist()
            self.saveToArchive()
        }
        
        var hasLaunched = NSUserDefaults.standardUserDefaults().boolForKey("firstTime")
        
            if hasLaunched == false {
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstTime")
        }
        
        self.title = "Future Dev Billionaires"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
     override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.saveToArchive()
    }
    
       func loadFromArchive() -> [Person]? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [Person] {
            return peopleFromArchive
        }
        return nil
    }
    
    func saveToArchive() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        NSKeyedArchiver.archiveRootObject(self.people, toFile: documentsPath + "/archive")
    }
    
    func loadFromPlist(){
        let plistURL = NSBundle.mainBundle().pathForResource("roster", ofType:"plist")
        let plistArray = NSArray(contentsOfFile: plistURL!)
        
        for object in plistArray! {
            if let personDictionary = object as? NSDictionary {
                let firstName = personDictionary["First Name"] as String
                let lastName = personDictionary["Last Name"] as String
                var person = Person(first: firstName, last: lastName)
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
        cellFirst.personImagView.image = personToDisplay.image
        
        return cellFirst
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_FULL_NAME" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            
            detailViewController.developer = self.people[selectedIndexPath!.row]
            
        }
    }
}

