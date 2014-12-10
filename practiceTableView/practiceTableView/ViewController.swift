//
//  ViewController.swift
//  practiceTableView
//
//  Created by RYAN CHRISTENSEN on 12/7/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var nameItem = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ryan = Item()
        ryan.name = "Ryan Christensen"
        
        self.nameItem = [ryan]
        
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
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameItem.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath) as NameTableViewCell
        
        var nameToDisplay = self.nameItem[indexPath.row]
        
        cell.nameLabel.text = nameToDisplay.name
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_DETAIL" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            
            var nameToPass = self.nameItem[selectedIndexPath!.row]
            detailViewController.selectedName = nameToPass
            
        }
    
    }
}

