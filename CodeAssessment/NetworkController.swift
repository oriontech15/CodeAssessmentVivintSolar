//
//  NetworkController.swift
//  CodeAssessment
//
//  Created by Justin Smith on 8/25/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import Foundation

class NetworkController {
    private let baseURLString = "http://api.randomuser.me/"
    
    static let sharedInstance = NetworkController()
    
    func fetchDataFor(numberOfUsers: Int, completion: (data: NSData?) -> Void) {
        guard let url = NSURL(string: baseURLString + "?results=\(numberOfUsers)") else {
            print("Not a valid url: \(baseURLString)?results=\(numberOfUsers)")
            completion(data: nil)
            return
        }
        
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            
            completion(data: data)
        }
        
        dataTask.resume()
    }
    
    func serializeDataToJSON(data: NSData) -> [String : AnyObject]? {
        return (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String : AnyObject]
    }
}
