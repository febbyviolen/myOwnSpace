//
//  GraphModel2.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/07.
//

import Foundation

struct GraphModel2: Identifiable{
    var id = UUID()
    var totalMood: Int
    var mood: Mood
    
    init(id: UUID = UUID(), totalMood: Int, mood: Mood) {
        self.id = id
        self.totalMood = totalMood
        self.mood = mood
    }
    
}
