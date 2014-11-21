//
//  person.swift
//  rosterAppTwo
//
//  Created by RYAN CHRISTENSEN on 11/18/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import Foundation
import UIKit

class Person {
    var firstName : String
    var lastName : String 
    var image : UIImage?
    
    init (name : String, last : String) {
        self.firstName = name
        self.lastName = last
    }

    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}
