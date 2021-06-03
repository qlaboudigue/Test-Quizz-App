//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Quentin Laboudigue on 22/05/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let text: String
    let choices: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        choices = a
        self.correctAnswer = correctAnswer
    }
    
}
