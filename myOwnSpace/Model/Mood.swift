//
//  Mood.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/05.
//

import Foundation

enum Mood: String, Codable {
    case soHappy
    case happy
    case okay
    case sad
    case angry
    
    var value: Int {
        switch self {
        case .soHappy:
            return 5
        case .happy:
            return 4
        case .okay:
            return 3
        case .sad:
            return 2
        case .angry:
            return 1
        }
    }
    
    var image: String {
        switch self{
        case .soHappy:
            return "sohappy"
        case .happy:
            return "happy"
        case .okay:
            return "ok"
        case .sad:
            return "sad"
        case .angry:
            return "angry"
        }
    }
    
    var desc: String {
        switch self{
        case .soHappy:
            return "sohappy"
        case .happy:
            return "happy"
        case .okay:
            return "ok"
        case .sad:
            return "sad"
        case .angry:
            return "angry"
        }
    }
}


enum Time: String, Codable{
    case thisMonth = "monthly"
    case thisWeek = "weekly"
    case thisYear = "yearly"
}


struct Diary: Codable, Equatable, Identifiable {
    var id = UUID()
    var mood: Mood
    var diary : String?
    var date: Date
    var timeRange: Time
    
    //init
    init(mood: Mood, diary: String? = nil, date: Date) {
        self.mood = mood
        self.diary = diary
        self.date = date
        self.timeRange = .thisMonth
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

    //get time string
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
    
    var haveTextDiary: Bool{
        if diary == nil {
            return false
        } else {
            return true
        }
    }
    
}

struct Recording : Equatable {
    
    let fileURL : URL
    let createdAt : Date
    var isPlaying : Bool
    
}
