//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Rodrigo Gouveia on 20/08/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain{
	let quiz: [QuestionArray] = [
		QuestionArray(question: "A slug's blood is green.", answer: "True"),
		QuestionArray(question: "Approximately one quarter of human bones are in the feet.", answer: "True"),
		QuestionArray(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
		QuestionArray(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
		QuestionArray(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
		QuestionArray(question: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
		QuestionArray(question: "You can lead a cow down stairs but not up stairs.", answer: "False"),
		QuestionArray(question: "Google was originally called 'Backrub'.", answer: "True"),
		QuestionArray(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
		QuestionArray(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
		QuestionArray(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
		QuestionArray(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
	]
	var questionNumber: Int = 0
	var score: Int = 0
	
	func checkAnswer(_ userAnswer: String) -> Bool{
		let actualAnswer: String = quiz[questionNumber].answer
		
		if userAnswer == actualAnswer{
			return true
		}
		else {
			return false
		}
	}
	
	func getQuestionText() -> String {
		return quiz[questionNumber].question
	}
	
	func getProgress() -> Float {
		return Float(questionNumber + 1)/Float(quiz.count)
	}
	
	mutating func nextQuestionUntilEnd(){
		if questionNumber + 1 < quiz.count {
			questionNumber += 1
		}
	}
	
	mutating func nextQuestionInfity(){
		if questionNumber + 1 < quiz.count {
			questionNumber += 1
		}
		else {
			questionNumber = 0
			score = 0
		}
	}
	
	mutating func setScore(){
		score += 1
	}
	func getScore() -> Int {
		return score
	}
	
	func endGame() -> Bool{
		return questionNumber + 1 == quiz.count
	}
}
