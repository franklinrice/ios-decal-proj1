//
//  NewViewController.swift
//  ToDoList
//
//  Created by Franklin Rice on 9/28/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit


class NewViewController: UIViewController {
    
    @IBOutlet weak var titleInput: UITextField!
    var delegate: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        let newTask = Task(title: titleInput.text!, time: NSDate())
        delegate!.tasks.append(newTask)

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
