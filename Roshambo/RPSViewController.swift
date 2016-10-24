//
//  RPSViewController.swift
//  Roshambo
//
//  Created by Juan Diego Fajardo on 5/26/16.
//  Copyright © 2016 Juan Diego Fajardo. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {

    enum RPSThrow: Int {
        case Rock = 0, Paper, Scissors
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // METHOD 1
    @IBAction func rock() {
        var controller: MatchViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("MatchViewController") as! MatchViewController
        controller.userThrow = MatchViewController.RPSThrow.Rock
        controller.computerThrow = MatchViewController.RPSThrow(rawValue: randomNum())
        
        presentViewController(controller, animated: true, completion: nil)
        
    }

    // METHOD 2
    @IBAction func paper() {
        performSegueWithIdentifier("throwScissors", sender: self)
    }
    
    
    // METHOD 2 / 3
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! MatchViewController
        
        if segue.identifier == "throwScissors" {
            controller.userThrow = .Scissors
        } else if segue.identifier == "throwPaper" {
            controller.userThrow = .Paper
        }
        
        controller.computerThrow = MatchViewController.RPSThrow(rawValue: randomNum())
    }
    
    
    func randomNum() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = Int(arc4random() % 3)
        
        // Return a more convenient Int, initialized with the random value
        return randomValue
    }

}

