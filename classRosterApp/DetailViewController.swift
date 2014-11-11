//
//  DetailViewController.swift
//  classRosterApp
//
//  Created by RYAN CHRISTENSEN on 11/6/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTextBox: UITextField!
    
    @IBOutlet weak var lastNameTextBox: UITextField!
    
    var reliever = person(name: "", last: "", Starter: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pitcher"
        self.firstNameTextBox.text = self.reliever.firstName
        self.lastNameTextBox.text = self.reliever.lastName
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.firstNameTextBox.delegate = self
        self.lastNameTextBox.delegate = self
    }
    
    //hide first name text field
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    //hide last name text field
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   }
