//
//  GameProgress.swift
//  Millionaire
//
//  Created by Павел Заруцков on 05.03.2021.
//

import Foundation

struct GameProgress: CustomStringConvertible {
    var description: String {
        return "\(current + 1)/\(total)"
    }
    
    let current: Int
    let total: Int
    
}
