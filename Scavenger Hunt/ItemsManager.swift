//
//  ItemsManager.swift
//  Scavenger Hunt
//
//  Created by Anurag Makineni on 9/4/15.
//  Copyright (c) 2015 Anurag Makineni. All rights reserved.
//

import Foundation

class ItemsManager {
    var items = [ScavengerHuntItem]()
    
    func archivePath() -> String? {
        if let directoryList = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) {
            if let documentsPath = directoryList.first as? String {
                return documentsPath + "/ScavengerHuntItems"
                
            }
        }
        
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if !NSKeyedArchiver.archiveRootObject(items, toFile: theArchivePath) {
                assertionFailure("Could not save data to \(theArchivePath)");
            }
        }
        else {
            assertionFailure("Could not determine where to save file!")
        }
    }
    
    func unarchiveSavedItems() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                items = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [ScavengerHuntItem]
            }
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
    
    
}
