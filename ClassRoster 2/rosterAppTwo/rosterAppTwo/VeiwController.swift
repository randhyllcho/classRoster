//
//  ViewController.swift
//  rosterAppTwo
//
//  Created by RYAN CHRISTENSEN on 11/18/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var manyPeople = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadFromPlist()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func loadFromPlist() {
        let plistURL = NSBundle.mainBundle
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10000
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NAME_CELL", forIndexPath: indexPath) as PersonTableViewCell
        
        cell.firstNameLabel.text = 
        return cell
    }
    
    
  

}

