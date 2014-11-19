//
//  Person.swift
//  classRosterApp
//
//  Created by RYAN CHRISTENSEN on 11/3/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import Foundation
import UIKit

class Person {
    var firstName : String
    var lastName : String
    //var isStarter = Bool()
    var image : UIImage?
    
    init (name : String, last : String) {
        self.firstName = name
        self.lastName = last
        //self.isStarter = Starter
    }
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}



