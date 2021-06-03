//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var choiceButton: UIButton!
    
    
    var quizBrain = QuizBrain()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel.text = "Score : 0"
        questionLabel.text = quizBrain.quiz[0].text
        trueButton.setTitle(quizBrain.quiz[0].choices[0], for: .normal)
        falseButton.setTitle(quizBrain.quiz[0].choices[1], for: .normal)
        choiceButton.setTitle(quizBrain.quiz[0].choices[2], for: .normal)
        progressBar.progress = 0.0
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
                
        let userAnswer = sender.currentTitle! // True, Flase
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        // Load next question text
        questionLabel.text = quizBrain.getQuestionText()
        // Load next choices
        let choicesList: [String]
        choicesList = quizBrain.getChoices()
        trueButton.setTitle(choicesList[0], for: .normal)
        falseButton.setTitle(choicesList[1], for: .normal)
        choiceButton.setTitle(choicesList[2], for: .normal)
        // Update score
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        choiceButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
    


}

