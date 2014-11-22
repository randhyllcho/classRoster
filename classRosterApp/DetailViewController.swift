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
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    
    var imagePickerController = UIImagePickerController()
    
    var showsCameraControls = true
    
    var cameraOverlayView: UIView?
    
    var developer = Person(first: "", last: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dev Profile"
        self.view.backgroundColor = UIColor.whiteColor()
        self.firstNameLabel.text = ""
        self.lastNameLabel.text = ""
        
        if (self.developer.image != nil) {
            self.imageView.image = self.developer.image!
        }         
        
        self.firstNameLabel.delegate = self
        self.lastNameLabel.delegate = self
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.developer.firstName = self.firstNameLabel.text
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

        self.developer.image = image
        
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        
    }
   }
