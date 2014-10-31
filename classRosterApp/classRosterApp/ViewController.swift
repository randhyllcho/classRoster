//
//  ViewController.swift
//  classRosterApp
//
//  Created by RYAN CHRISTENSEN on 10/29/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class person {
    var firstName = ""
    var lastName = ""
    var isStudent = Bool()
    
    init (name : String, last : String, Student : Bool) {
        self.firstName = name
        self.lastName = last
        self.isStudent = Student
    }
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

var myName = person(name: "Ryan", last: "Christensen", Student: true)

class ViewController: UIViewController {
    
    @IBAction func whatNameButton() {
        println(myName.fullName()) 
    }
    
}

