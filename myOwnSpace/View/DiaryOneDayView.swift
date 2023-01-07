//
//  DiaryOneDayView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/04.
//

import SwiftUI

struct DiaryOneDayView: View {
    
    var diarys: [Diary]
    
    var body: some View {
        HStack{
            VStack{
                Text(diarys.first!.dateString)
                    .bold()
                    .foregroundColor(Color("ebd9fc"))
                Text(diarys.first!.monthString)
                    .bold()
                    .foregroundColor(Color("ebd9fc"))
                Spacer()
                
                Text("Moods: \(diarys.count)")
                    .font(.subheadline)
                    .foregroundColor(Color("ebd9fc"))
                Text("Stories: \(TotalText())")
                    .font(.subheadline)
                    .foregroundColor(Color("ebd9fc"))
            }
            .padding(.horizontal)
            .padding(.leading)
            
            Divider()
                .overlay(Color("ebd9fc"))
            
            VStack(alignment: .leading){
                DiaryImage()
                Divider()
                    .overlay(Color("ebd9fc"))
                Text(DiaryTextString())
                    .font(.subheadline)
                    .lineLimit(3)
                    .foregroundColor(Color("ebd9fc"))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.trailing)
        }
        
        .padding(.vertical)
        .fixedSize(horizontal: false, vertical: true)
        .background(Color("252328"))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.3), radius: 1, y: 1)
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    func TotalText() -> String {
        var total: Int = 0
        for diary in diarys {
            if diary.haveTextDiary == true {
                total += 1
            }
        }
        return String(total)
    }
    
    func DiaryTextString() -> String {
        var str: String = ""
        for diary in diarys {
            if diary.haveTextDiary {
                str += diary.timeString
                str += "\n" + diary.diary! + "\n"
            }
        }
        return str
    }

}

struct DiaryOneDayView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryOneDayView(diarys: [Diary(mood: Mood(moodState: .happy, moodImage: .happyImage), diary: "hello my name is febby?", date: Date()), Diary(mood: Mood(moodState: .sad, moodImage: .sadImage), date: Date())])
    }
}

extension DiaryOneDayView {
    func DiaryImage() -> some View{
        HStack{
            ForEach(diarys) { diary in
                Image(diary.mood.moodImage.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, alignment: .leading)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
    
}
