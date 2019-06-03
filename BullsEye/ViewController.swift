//
//  ViewController.swift
//  BullsEye
//
//  Created by Preston Jarnagin on 5/30/19.
//  Copyright © 2019 Preston Jarnagin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var currentRound = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      let roundedValue = slider.value.rounded()
      currentValue = Int(roundedValue)
      targetValue = Int.random(in: 1...100)
      startOver()
      
      let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
      slider.setThumbImage(thumbImageNormal, for: .normal)
      
      let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
      slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
      
      let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
      
      let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
      let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
      slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
      
      let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
      let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
      slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func showAlert(){
        let difference: Int = abs(currentValue - targetValue)
        var points = (100 - difference)
        score += points
        
        let title: String
        var continueMessage = "Awesome"
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference == 1 {
            title = "So close!"
            points += 50
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good"
        } else {
            title = "Not even close..."
            continueMessage = "Meh"
        }
        
        let message = "The slider was at: \(currentValue)" +
            "\nThe target was: \(targetValue)" +
            "\nThe difference was \(difference)" +
            "\nYou scored \(points) points!"
        let action = UIAlertAction(title: continueMessage, style: .default, handler: {
            action in
            self.startNewRound()
        })
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        currentRound += 1
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(currentRound)
    }
    
    @IBAction func startOver(){
        score = 0
        currentRound = 0
        startNewRound()
    }
}

