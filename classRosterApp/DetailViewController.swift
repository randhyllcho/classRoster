//
//  DetailViewController.swift
//  classRosterApp
//
//  Created by RYAN CHRISTENSEN on 11/6/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    var relieverFirst = person(name: "", last: "", Starter: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pitcher"
        self.nameLabel.text = self.relieverFirst.firstName
        self.lastNameLabel.text = self.relieverFirst.lastName
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
