//
//  DetailViewController.swift
//  classRosterApp
//
//  Created by RYAN CHRISTENSEN on 11/6/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstNameTextBox: UITextField!
    @IBOutlet weak var lastNameTextBox: UITextField!
    
    var imagePickerController = UIImagePickerController()
    
    var showsCameraControls = true
    
    var cameraOverlayView: UIView?
    
    var reliever = person(name: "", last: "", Starter: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pitcher"
        self.firstNameTextBox.text = self.reliever.firstName
        self.lastNameTextBox.text = self.reliever.lastName
        firstNameTextBox.font = UIFont(name: "Didot", size: 15)
        lastNameTextBox.font = UIFont(name: "Didot", size: 15)
        self.view.backgroundColor = UIColor.whiteColor()
        
        if (self.reliever.image != nil) {
            self.imageView.image = self.reliever.image!
        } else {
            self.imageView.image = self.imageView.image
        }
        
        
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
    
    
    @IBAction func camerButtonPressed(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
        
    }
    
     func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        
        self.imageView.image = image

        self.reliever.image = image
        
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        
    }
   }
