
//
//  ScavengerHuntItem.swift
//  Scavenger Hunt
//
//  Created by Anurag Makineni on 9/3/15.
//  Copyright (c) 2015 Anurag Makineni. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject {
    
    let name: String
    var photo: UIImage?
    
    var isCompleted: Bool {
        get{
            return photo != nil
        }
    }
    
    init(name: String) {
        self.name = name
    }
}


