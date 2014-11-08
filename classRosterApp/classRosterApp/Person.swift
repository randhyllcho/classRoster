//
//  Person.swift
//  classRosterApp
//
//  Created by RYAN CHRISTENSEN on 11/3/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import Foundation

class person {
    var firstName = "Dave"
    var lastName = "Henderson"
    var isStarter = Bool()
    
    init (name : String, last : String, Starter : Bool) {
        self.firstName = name
        self.lastName = last
        self.isStarter = Starter
    }
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}



