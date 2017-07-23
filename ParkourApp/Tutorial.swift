//
//  Tutorial.swift
//  ParkourApp
//
//  Created by FOEIT on 25/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

class Tutorial {
    // MARK: Properties
    
    let title: String
    let desc: String
    let pkimage: UIImage
    
    // MARK: Initialization
    
    init?(title: String, desc: String, pkimage: UIImage) {
        // Initialize stored properties.
        self.title = title
        self.desc = desc
        self.pkimage = pkimage
        
        // Initialization should fail if there is no name or if the rating is negative.
        if title.isEmpty {
            return nil
        }
    }
}
