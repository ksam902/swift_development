//
//  ViewController.swift
//  CoreDataCustomObjects
//
//  Created by Kyle Samson on 2015-02-07.
//  Copyright (c) 2015 Kyle Samson. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtFunny: UITextField!
    @IBOutlet weak var lblResults: UITextView!
    @IBOutlet weak var lblFunny: UILabel!
    @IBOutlet weak var btnFunny: UIButton!
    
    var thisUser: Users!
    
    @IBAction func btnSave(sender: UIButton) {
        //close keyboard
        closeKeyboard()
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        //referrencing out NSManaged Object
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        // !!! can now access/reference our database
        
        let ent = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        
        //create an instance of our Users Class
        var newUser = Users(entity: ent!, insertIntoManagedObjectContext: context)
        newUser.username = txtUsername.text
        newUser.password = txtPassword.text
        
        // nil because we are not worrying about errors at this point
        context.save(nil)
        println(newUser)
        println("Object Saved.")
        
        clearOutput()

    }
    
    @IBAction func btnLoad(sender: UIButton) {

        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        //referrencing out NSManaged Object
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        // !!! can now access/reference our database
        let request = NSFetchRequest(entityName: "Users")
        // -- prevents CoreData from returning a list of object - this way CoreData return an instance of the object we are looking for
        request.returnsObjectsAsFaults = false
        
        // -- create a predicate
        request.predicate = NSPredicate(format: "username = %@", txtUsername.text)
        
        var results: NSArray = context.executeFetchRequest(request, error: nil)!
        
        if results.count > 0 {
            btnFunny.enabled = true
            // loop through objects in results as cast them to custom made Users Class and get access to their properties
            // easier to use
            for user in results {
                // ******* This line causes error - see Users.swift for details
                thisUser = user as Users
                lblResults.text = "The users username is \(thisUser.username) and password is \(thisUser.password)"
                println(thisUser.toString())
            }
            
            println("\(results.count) found!")
        }else{
            println("No Results Found!")
        }
        //close keyboard
        closeKeyboard()
    }
    
    @IBAction func btnFunny(sender: UIButton) {
        //close keyboard
        closeKeyboard()
        lblFunny.text = thisUser.addFunnyPrefix(txtFunny.text)
    }
    
    func closeKeyboard(){
        self.txtUsername.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
        self.txtFunny.resignFirstResponder()
    }
    func clearOutput(){
        // -- textfields
        txtUsername.text = ""
        txtPassword.text = ""
        txtFunny.text = ""
    }
    //-- Function to hide the keyboard, if visible, when the user clicks anywhere off the two input fields
    //-- Built-in method
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // call to the main view - the entire school - stop editing anything that is receiving input
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnFunny.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

