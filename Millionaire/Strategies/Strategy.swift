//
//  Strategy.swift
//  Millionaire
//
//  Created by Павел Заруцков on 05.03.2021.
//

import Foundation

protocol QuestionStrategyProcotol {
    func getQuestions(initial: [Question]) -> [Question]
}

class StrategyFactory {
    
    class func factory(strategy: QuestionStrategy) -> QuestionStrategyProcotol {
        switch strategy {
        case .Random:
            return RandomQuestionStrategy()
        case .Sequental:
            return OrderQuestionStrategy()
        }
    }
    
}
