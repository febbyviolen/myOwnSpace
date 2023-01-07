//
//  GraphModel.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/06.
//

import Foundation

struct GraphModel: Identifiable{
    var id = UUID()
    var date: Date
    var value: Double
    
    init(id: UUID = UUID(), date: Date, value: Double) {
        self.id = id
        self.date = date
        self.value = value
    }
    
    //get date string
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        
        let date = dateFormatter.string(from: date)
        return date
    }
    
}
