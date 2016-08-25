//
//  User+CoreDataProperties.swift
//  CodeAssessment
//
//  Created by Justin Smith on 8/25/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var email: String
    @NSManaged var imageURL: String
    @NSManaged var phoneNumber: String

}
