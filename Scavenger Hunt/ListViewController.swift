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
    
    var myManager = ItemsManager()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myManager.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as! UITableViewCell //this is being cast to a UITableViewCell since the method returns "any object"
        
        let item = myManager.items[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addVC = segue.sourceViewController as! AddViewController
            
            if let newItem = addVC.newItem {
                
                myManager.items += [newItem]
                myManager.save()
                
                let indexPath = NSIndexPath(forRow: myManager.items.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic
                )
            }
        }
    }
    
    //implement delete feature
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            myManager.items.removeAtIndex(indexPath.row)
            myManager.save()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}
