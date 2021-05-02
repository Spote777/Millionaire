//
//  Game.swift
//  Millionaire
//
//  Created by Павел Заруцков on 24.02.2021.
//

import Foundation
class Game {
    static var shared = Game()
    private var session: GameSession?
    private(set) var results: [GameResults] = []
    private(set) var settings: GameSettings
    
    private var gameResultsCareTaker = GameCaretaker()
    private var gameSettingsCareTaker = GameSettingsCaretaker()
    private var userQuestionsAdapter = QuestionAdapter()
    
    private var questionBuilder = QuestionBuilder()
    
    private init() {
        results = gameResultsCareTaker.loadRecords()
        settings = gameSettingsCareTaker.loadSettings()
    }
    
    func addResult(_ result: GameResults) {
        results.append(result)
        gameResultsCareTaker.saveRecords(records: results)
    }
    
    func saveSettings(_ settings: GameSettings) {
        self.settings = settings
        gameSettingsCareTaker.saveSettings(settings: settings)
    }
    
    func saveUserQuestionsAnswers(questions: [String], answers: [String]) {
        userQuestionsAdapter.saveUserQuestionsAnswers(questions: questions, answers: answers)
    }
    
    func getUserQuestionsAnswers() -> [UserQuestionDto] {
        return userQuestionsAdapter.getUserQuestionDtoList()
    }
    
    func newGame() {
        
        let questionBuilder = QuestionBuilder()
        
        let questions = StrategyFactory
            .factory(strategy: settings.strategyType)
            .getQuestions(initial: questionBuilder.build(userQuestionsAnswersDto: userQuestionsAdapter.getUserQuestionDtoList()))
        
        session = GameSession(questions: questions)
    }
    
    func finish() -> GameResults? {
        let results = session?.finish()
        session = nil
        
        return results
    }
    
    func handleAnswer(_ answer: Answer) -> QuestionModel? {
        return session?.handleAnswer(answer)
    }
    
    func getQuestionViewModel() -> QuestionModel? {
        return session?.getQuestionViewModel()
    }
}

