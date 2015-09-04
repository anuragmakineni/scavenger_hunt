//
//  ListViewController.swift
//  Scavenger Hunt
//
//  Created by Anurag Makineni on 9/3/15.
//  Copyright (c) 2015 Anurag Makineni. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    var itemsList = [ScavengerHuntItem(name: "Train 🚆"), ScavengerHuntItem(name: "Car 🚗"), ScavengerHuntItem(name: "Plane ✈️")]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as! UITableViewCell //this is being cast to a UITableViewCell since the method returns "any object"
        
        let item = itemsList[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addVC = segue.sourceViewController as! AddViewController
            
            if let newItem = addVC.newItem {
                itemsList += [newItem]
                let indexPath = NSIndexPath(forRow: itemsList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic
                )
            }
        }
    }
    
    //implement delete feature
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            itemsList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}
