//
//  QuestionBuilder.swift
//  Millionaire
//
//  Created by Павел Заруцков on 05.03.2021.
//

import Foundation

class QuestionBuilder {
    
    let initial: [Question]
    var wrongAnwers: [String] = []
    
    init() {
        initial = QuestionData.loadQuestions()
    }
    
    func build(userQuestionsAnswersDto: [UserQuestionDto]) -> [Question] {
        wrongAnwers = getWrongAnswers()
        
        let userQuestions = userQuestionsAnswersDto.map({ buildQuestion(dto: $0) })
        
        return initial + userQuestions
    }
    
    
    private func buildQuestion(dto: UserQuestionDto) -> Question {
        return Question(text: dto.question, variants: buildVariants(dto: dto))
    }
    
    private func buildVariants(dto: UserQuestionDto) -> [Answer: Variant] {
        wrongAnwers.shuffle()
        
        var variants: [Variant] = [
            Variant(text: dto.answer, isRight: true)
        ]
        
        for _ in 0..<3 {
            variants.append(Variant(text: wrongAnwers.removeFirst(), isRight: false))
        }
        
        variants.shuffle()
        
        var result: [Answer: Variant] = [:]
        
        for a in Answer.allCases {
            result[a] = variants.removeFirst()
        }
        
        return result
    }
    
    
    private func getWrongAnswers() -> [String] {
        var answers: [String] = []
        for q in initial {
            for (_, v) in q.variants {
                if v.isRight { continue }
                answers.append(v.text)
            }
        }
        return answers
    }
}
