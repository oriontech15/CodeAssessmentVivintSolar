//
//  ImageController.swift
//  CodeAssessment
//
//  Created by Justin Smith on 8/25/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    static func fetchImageForImageURL(url: NSURL, completion: (image: UIImage?) -> Void) {
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
                completion(image: nil)
            } else {
                if let data = data, image = UIImage(data: data) {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completion(image: image)
                    })
                } else {
                    completion(image: nil)
                }
            }
        }
        dataTask.resume()
    }
}