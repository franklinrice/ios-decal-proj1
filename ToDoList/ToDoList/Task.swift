//
//  Task.swift
//  ToDoList
//
//  Created by Franklin Rice on 9/30/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Task {
    var title: String?
    //var description: String?
    var time: NSDate //time of completion
    var completed:Bool = false
    
    init(title: String, time: NSDate) {
        self.time = time
        self.title = title
        //self.description = description
    }
}