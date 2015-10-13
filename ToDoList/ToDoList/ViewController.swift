//
//  ViewController.swift
//  ToDoList
//
//  Created by Franklin Rice on 9/28/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var tasksInLastDay: Int = 0
    var tasksTotal: Int = 0
    var tasks = [Task]()
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        let task = tasks[row]
        if (task.completed == false) {
            tasksInLastDay += 1
            tasksTotal += 1
        } else {
            tasksInLastDay -= 1
            tasksTotal -= 1
        }
        task.completed = !task.completed
        self.tableView.reloadData()
        }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete) {
            let row = indexPath.row
            tasks.removeAtIndex(row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        cell.textLabel!.text = self.tasks[indexPath.row].title!
        //let desc = cell.viewWithTag(1) as! UILabel
        //desc.text = self.tasks[indexPath.row].description!
        
        let task = tasks[indexPath.row]
        if (task.completed) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell!
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        cleanOutdatedTasks()
        self.tableView.reloadData()
    }
    
    func cleanOutdatedTasks() {
        let now: NSDate = NSDate()
        if (tasks.count > 0) {
            for (index, task) in tasks.enumerate() {
                if (task.completed && now.timeIntervalSinceDate(task.time) > 86400) {
                    tasks.removeAtIndex(index)
                }
            }
        }
    }
    
    func getTaskByTitle(name: String) -> Task? {
        if (tasks.count > 0) {
            for i in 0...tasks.count-1 {
                if (tasks[i].title == name) {
                    return tasks[i]
                }
            }
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "GoToNew") {
            let nav = segue.destinationViewController as! NewViewController
            nav.delegate = self
        }
        else {
            let nav = segue.destinationViewController as! StatsViewController
            nav.delegate = self
        }
    }
    
    func update(task: Task) {
            tasks.append(task)
    }


}

