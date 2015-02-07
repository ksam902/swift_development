//
//  ViewController.swift
//  CoreData
//
//  Created by Kyle Samson on 2015-02-07.
//  Copyright (c) 2015 Kyle Samson. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtSearch: UITextField!
    
    @IBAction func btnSave(sender: UIButton) {
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        // -- Creating New User object of type Any Object, so we cast it back to a NSManagedObject so we get the properties and methods for use
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        
        // -- set information for Data Model - Inserting into Users Table in specific columns
        newUser.setValue(txtUserName.text, forKey: "username")
        newUser.setValue(txtPassword.text, forKey: "password")
        
        //get it to save
        context.save(nil)
        txtUserName.text = ""
        txtPassword.text = ""
        println(newUser)
        println("Object Saved.")
        
        //println("Save button pressed with \(txtUserName.text)")
        
    }
    
    @IBAction func btnLoad(sender: UIButton) {
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        // From Users Table
        var request = NSFetchRequest(entityName: "Users")
        
        // Stops some weird stuff from happening
        request.returnsObjectsAsFaults = false
        
        //adding a predicate
        request.predicate = NSPredicate(format: "username = %@", txtSearch.text)
        
        
        var results: NSArray = context.executeFetchRequest(request, error: nil)!
        
        if results.count > 0 {
            var res = results[0] as NSManagedObject
            txtUserName.text = res.valueForKey("username") as String
            txtPassword.text = res.valueForKey("password") as String
            println("Users Loaded.")
            
//            for result in results{
//                println(result)
//                println("Users Loaded.")
//            }
            
        }else{
            println("0 Results Returned...Potential Error")
        }
        
        //println("Load button pressed with \(txtPassword.text)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

