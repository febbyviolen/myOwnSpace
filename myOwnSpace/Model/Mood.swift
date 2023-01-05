//
//  Mood.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/05.
//

import Foundation

enum MoodState: String, Codable {
    case soHappy
    case happy
    case okay
    case sad
    case angry
}

enum MoodImage: String, Codable {
    case soHappyImage = "sohappy"
    case happyImage = "happy"
    case okayImage = "ok"
    case sadImage = "sad"
    case angryImage = "angry"
}

struct Mood: Codable {
    var moodState: MoodState
    var moodImage: MoodImage
}

struct Diary: Codable, Equatable, Identifiable {
    var id = UUID()
    var mood: Mood
    var diary : String?
    var date: Date
    
    //init
    init(mood: Mood, diary: String? = nil, date: Date) {
        self.mood = mood
        self.diary = diary
        self.date = date
    }
    
    //get date string
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        
        let date = dateFormatter.string(from: date)
        return date
    }
    
    //get month string
    var monthString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        
        let month = dateFormatter.string(from: date)
        return month
    }

    var timeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let month = dateFormatter.string(from: date)
        return month
    }
    
    static func == (lhs: Diary, rhs: Diary) -> Bool {
        if lhs.date == rhs.date {
            return true
        } else {
            return false
        }
    }
    
}
