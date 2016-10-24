//
//  MatchViewController.swift
//  Roshambo
//
//  Created by Juan Diego Fajardo on 5/26/16.
//  Copyright © 2016 Juan Diego Fajardo. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    enum RPSThrow: Int {
        case Rock = 0, Paper, Scissors
    }
    
    
    var userThrow: RPSThrow?
    var computerThrow: RPSThrow?
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func viewWillAppear(animated: Bool) {
        let result: String
        let image: String
        (result, image) = calculateWinner()
        
        // Top Label
        switch result {
            case "tie":
                titleLable.text = "SO CLOSE"
            case "lose":
                titleLable.text = "YOU LOSE"
            case "win":
                titleLable.text = "YOU WIN"
            default:
                titleLable.text = "ERROR"
        }
        
        resultImage.image = UIImage(named: image)
        
        // Bottom Label
        switch image {
            case "tieGame":
                descriptionLabel.text = "TIE TIE TIEEEEE"
            case "paperBeatsRock":
                descriptionLabel.text = "PAPER beats ROCK"
            case "rockBeatsScissors":
                descriptionLabel.text = "ROCK beats SCISSORS"
            case "scissorsBeatsPaper":
                descriptionLabel.text = "SCISSORS beats PAPER"
            default:
                descriptionLabel.text = "ERROR"
        }
        
        
        
    }
    
    func calculateWinner() -> (String, String) {
        if let userThrow = self.userThrow {
            if let computerThrow = self.computerThrow {
                var result = ""
                var image = ""
                switch (userThrow, computerThrow) {
                    case (.Rock, .Rock):
                        result = "tie"
                        image = "tieGame"
                    case (.Scissors, .Scissors):
                        result = "tie"
                        image = "tieGame"
                    case (.Paper, .Paper):
                        result = "tie"
                        image = "tieGame"
                    case (.Rock, .Paper):
                        result = "lose"
                        image = "paperBeatsRock"
                    case (.Paper, .Scissors):
                        result = "lose"
                        image = "scissorsBeatsPaper"
                    case (.Scissors, .Rock):
                        result = "lose"
                        image = "rockBeatsScissors"
                    case (.Rock, .Scissors):
                        result = "win"
                        image = "rockBeatsScissors"
                    case (.Paper, .Rock):
                        result = "win"
                        image = "papeBeatsRock"
                    case (.Scissors, .Paper):
                        result = "win"
                        image = "scissorsBeatsPaper"
                }
                return (result, image)
            }
        }
        
        return ("", "")
    }
    

    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
