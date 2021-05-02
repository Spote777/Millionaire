//
//  File.swift
//  Millionaire
//
//  Created by Павел Заруцков on 05.03.2021.
//

import Foundation

class RandomQuestionStrategy: QuestionStrategyProcotol {
    
    func getQuestions(initial: [Question]) -> [Question] {
        return initial.shuffled()
    }
    
}
