//
//  MoodModelController.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/05.
//

import Foundation

class MoodModelController: ObservableObject {
    @Published var diarys: [Diary] = []
    @Published var graph: [GraphModel] = []
    @Published var graph2: [GraphModel2] = []
    
//    init() {
//        loadFromPersistentStore()
//    }
    
    //add new diary for today
    func createDiary(mood: Mood, diaryText: String?, date: Date) {
        let newDiary = Diary(mood: mood, diary: diaryText, date: date)
        
        diarys.append(newDiary)
        //saveToPersistentStore()
    }
    
    //delete diary
    func deleteDiary(at offset: IndexSet) {
        guard let index = Array(offset).first else { return }
        
        diarys.remove(at: index)
        //saveToPersistentStore()
    }
    
    //update diary
    func updateDiary(diary: Diary, mood: Mood, diaryText: String?, date: Date){
        if let index = diarys.firstIndex(of: diary) {
            var diary = diarys[index]
            diary.mood = mood
            diary.diary = diaryText
            diary.date = date
            
            diarys[index] = diary
            //saveToPersistentStore()
        }
    }
    
    //save, load data from persistent, URL
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        else {return nil}
        
        return documents.appendingPathComponent("diary.plist")
    }
    
    
    //Starts -> Data -> Plist
    func persistentFileStore() {
        guard let url = persistentFileURL else {return}
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(diarys)
            try data.write(to: url)
            
        } catch {
            print("Error savings data: \(error)")
        }
    }
    
    func loadFromPersistentStore(){
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {return}
        do{
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            diarys = try decoder.decode([Diary].self, from: data)
        } catch {
            print("error loading data: \(error)")
        }
    }
    
    func MoodValue(){
        var currentDate: Date = Date()
        var currentValue: Double = 0
        var total: Double = 0
        for diary in diarys {
            if diary.date == currentDate {
                total += 1
                currentValue += Double(diary.mood.value)
            } else {
                currentValue = currentValue/total
                graph.append(GraphModel(date: currentDate, value: currentValue))

                currentDate = diary.date
                currentValue = 0
                total = 0
            }
        }
    }
    
    
}
