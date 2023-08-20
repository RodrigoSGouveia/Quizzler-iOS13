//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var falseButton: UIButton!
	@IBOutlet weak var trueButton: UIButton!
	@IBOutlet weak var progressBar: UIProgressView!
	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	var timer = Timer()
	
	var quizBrain = QuizBrain()
	var setToEnd = true
	
//	let quiz = [
//		["Four + Two is equal to Six", "True"],
//		["Five - three is greater than One", "True"],
//		["Three + Eight is less thans Ten", "False"]
//	]	
	

 
    override func viewDidLoad() {
        super.viewDidLoad()
		
		updateUi()
        // Do any additional setup after loading the view.
    }

	@IBAction func answerButtonPressed(_ sender: UIButton) {
		
		
		if setToEnd {
			let userAnswer = sender.currentTitle!
			let answerResult = quizBrain.checkAnswer(userAnswer)
			
			if answerResult {
				sender.backgroundColor = UIColor.green
				quizBrain.setScore()
			} else {
				sender.backgroundColor = UIColor.red
			}
			
			quizBrain.nextQuestionInfity()
			
			timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
		} else {
			if !quizBrain.endGame(){
				let userAnswer = sender.currentTitle!
				let answerResult = quizBrain.checkAnswer(userAnswer)
				
				if answerResult {
					sender.backgroundColor = UIColor.green
					quizBrain.setScore()
				} else {
					sender.backgroundColor = UIColor.red
				}
				
				quizBrain.nextQuestionUntilEnd()
				
				timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
			}
			else {
				trueButton.isEnabled = false
				falseButton.isEnabled = false
			}
		}
		
		
	}
	
	@objc func updateUi(){
		questionLabel.text = quizBrain.getQuestionText()
		progressBar.progress = quizBrain.getProgress()
		
		scoreLabel.text = "Score: \(quizBrain.getScore())"
		
		trueButton.backgroundColor = UIColor.clear
		falseButton.backgroundColor = UIColor.clear
		
	}
	
}
