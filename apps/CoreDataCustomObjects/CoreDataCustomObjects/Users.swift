//
//  Users.swift
//  CoreDataCustomObjects
//
//  Created by Kyle Samson on 2015-02-07.
//  Copyright (c) 2015 Kyle Samson. All rights reserved.
//

import UIKit
import CoreData
// ********** CoreData library is written in Objective-C and doesn't have access to this class -- Need to make this class available to CoreData
// ********** Also need to make change in DATA MODEL - EDIT CONFIGURATION C - Default AND MAP TO CLASS
@objc(Users)


class Users: NSManagedObject {

    // create two NSManaged Objects referring to the two attributes in our Users Entity
    @NSManaged var username:String
    @NSManaged var password:String
    
    func toString() -> String{
        return "The username is : \(username), their password is : \(password)."
    }
    func addFunnyPrefix(prefix: String) -> String{
        username = "\(prefix)\(username)"
        return username
    }
}
