//
//  TeamViewController.swift
//  practiceTable3
//
//  Created by RYAN CHRISTENSEN on 12/9/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var selectedTeam : Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityTextField.text = selectedTeam?.city
        self.nameTextField.text = selectedTeam?.teamName

        self.cityTextField.delegate = self
        self.nameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.selectedTeam?.city = self.cityTextField.text
        self.selectedTeam?.teamName = self.nameTextField.text
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
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
