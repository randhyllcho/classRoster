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
    
    var selectedPerson = person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedPerson.first
        self.nameLabel.text = self.selectedPerson.first
        self.view.backgroundColor = UIColor.cyanColor()


        // Do any additional setup after loading the view.
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
