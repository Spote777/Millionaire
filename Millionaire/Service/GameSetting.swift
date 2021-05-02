//
//  GameSetting.swift
//  Millionaire
//
//  Created by Павел Заруцков on 05.03.2021.
//

import Foundation

enum QuestionStrategy: Int, Codable {
    case Random
    case Sequental
}

class GameSettings: Codable {
    var strategyType: QuestionStrategy = .Sequental
}
