//
//  UserController.swift
//  CodeAssessment
//
//  Created by Justin Smith on 8/25/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import Foundation
import CoreData

class UserController {
    
    private let resultsKey = "results"
    
    static let sharedInstance = UserController()
    
    func fetchUsers(numberOfUsers: Int, completion: (users: [User]?) -> Void) {
        NetworkController.sharedInstance.fetchDataFor(numberOfUsers) { (data) in
            guard let data = data else { print("Data was nil"); return }
            
            guard let json = NetworkController.sharedInstance.serializeDataToJSON(data) else {
                print("Could not serialize data to JSON")
                completion(users: nil)
                return
            }
            
            guard let resultsArray = json[self.resultsKey] as? [[String : AnyObject]] else {
                print("Could not convert to dictionary")
                completion(users: nil)
                return
            }
            
            let users = resultsArray.flatMap{ User(dictionary: $0)}
            self.save()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(users: users)
            })
        }
    }
    
    func fetchUsersInContext(context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) -> [User]? {
        let request = NSFetchRequest(entityName: User.className)
        
        return (try? context.executeFetchRequest(request)) as? [User]
    }
    
    
    func deleteUsers(users: [User]) {
        for user in users {
            user.managedObjectContext?.deleteObject(user)
        }
        save()
    }
    
    func save() {
        _ = try? Stack.sharedStack.managedObjectContext.save()
    }
}