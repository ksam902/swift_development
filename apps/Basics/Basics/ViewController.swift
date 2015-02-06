//
//  ViewController.swift
//  Basics
//
//  Created by Kyle Samson on 2015-02-06.
//  Copyright (c) 2015 Kyle Samson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //-----Override functions given be default - not needed for this tutorial.
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    
    //-- @IBOutlet refers to InterfaceBuilderOutlet - Label
    //-- weak can break connection - in this case to the button
    //-- ! means that the object has a value, it is not nil - compiler doesn't need to check if it is empty - saves on time
    
    @IBOutlet weak var firstLabel: UILabel!
    
    //-- Can multiple buttons linked to the same function - in this case Bacon and Tuna
    //-- Sender is the object that called this method - in this case either the Bacon or the Tuna button
    @IBAction func buttonPressed(sender: UIButton) {
        //constant for the title variable
        // ! tells us the title variable has a value, again helps compiler
        
        let title = sender.titleForState(.Normal)!
        firstLabel.text = "You think \(title)"
    }
    //-- Getting reference to the email and password buttons
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    //-- Function to hide keyboard when user clicks the Log In Button
    @IBAction func btnLogIn(sender: UIButton) {
        
        self.email.resignFirstResponder()
        self.password.resignFirstResponder()
        
    }
    //-- Function to hide the keyboard, if visible, when the user clicks anywhere off the two input fields
    //-- Built-in method
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // call to the main view - the entire school - stop editing anything that is receiving input
        self.view.endEditing(true)
    }
}

