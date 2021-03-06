//
//  GameCaretaker.swift
//  Millionaire
//
//  Created by Павел Заруцков on 24.02.2021.
//

import Foundation

typealias Memento = Data

class GameCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "gameResults"
    
    func saveRecords(records: [GameResults]) {
        do {
            let data: Memento = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [GameResults] {
        guard let data: Memento = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([GameResults].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
