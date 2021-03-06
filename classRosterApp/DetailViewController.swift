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
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    
    var imagePickerController = UIImagePickerController()
    
    var showsCameraControls = true
    
    var cameraOverlayView: UIView?
    
    var developer: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.developer?.fullName()
        self.view.backgroundColor = UIColor.whiteColor()
        self.firstNameText.text = self.developer?.firstName
        self.lastNameText.text = self.developer?.lastName
        
        if (self.developer?.image != nil) {
            self.imageView.image = self.developer?.image
        }
            
        self.firstNameText.delegate = self
        self.lastNameText.delegate = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.developer?.firstName = self.firstNameText.text
        self.developer?.lastName = self.lastNameText.text
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
        
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        
        self.developer?.image = image
        
    }
   }
