//
//  ViewController.swift
//  practiceTable2
//
//  Created by RYAN CHRISTENSEN on 12/9/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movieList = [Movie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var godfather = Movie()
        godfather.favMovie = "The Godfather"
        
        self.movieList = [godfather]
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath) as MovieTableViewCell
        
        var movieToDisplay = self.movieList[indexPath.row]
        
        cell.movieLabel.text = movieToDisplay.favMovie
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MOVIE_CHOICE" {
            let secondVC = segue.destinationViewController as SecondViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            
            var movieToPass = self.movieList[selectedIndexPath!.row]
            secondVC.selectedMovie = movieToPass
            
        }
    }


}

