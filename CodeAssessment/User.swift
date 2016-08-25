//
//  User.swift
//  CodeAssessment
//
//  Created by Justin Smith on 8/25/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {
    static  let className = "User"
    private let nameKey = "name"
    private let firstNameKey = "first"
    private let lastNameKey = "last"
    private let emailKey = "email"
    private let phoneKey = "phone"
    private let imageKey = "picture"
    private let thumbnailKey = "thumbnail"

// Insert code here to add functionality to your managed object subclass
    
    convenience init(firstName: String, lastName: String, email: String, image: NSData, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName(User.className, inManagedObjectContext: context) else {fatalError("Could not get entity for name \(User.className) in context")}
        self.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    convenience init?(dictionary: [String : AnyObject], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName(User.className, inManagedObjectContext: context) else {fatalError("Could not get entity for name \(User.className) in context")}
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        guard let nameDictionary = dictionary[nameKey] as? [String : String],
            firstName = nameDictionary[firstNameKey],
            lastName = nameDictionary[lastNameKey],
            email = dictionary[emailKey] as? String,
            phoneNumber = dictionary[phoneKey] as? String,
            imageDictionary = dictionary[imageKey],
            thumbnailURL = imageDictionary[thumbnailKey] as? String else { return nil }
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.imageURL = thumbnailURL
    }

}
