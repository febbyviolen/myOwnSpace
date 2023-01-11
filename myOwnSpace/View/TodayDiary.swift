//
//  TodayDiary.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/30.
//

import SwiftUI

struct TodayDiary: View {
    
    var diary: Diary
    
    var body: some View {
        HStack{
            VStack(spacing: 5){
                Text(diary.dateString)
                    .bold()
                    .foregroundColor(Color("ebd9fc"))
                
                Text(diary.timeString)
                    .font(.subheadline)
                    .foregroundColor(Color("d4bbfc"))
                
                Image(diary.mood.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding(.top, 5)
                    
                Spacer()
            }
            .padding(.horizontal)
            .padding(.horizontal)
            
            
            Divider()
                .overlay(Color("ebd9fc"))
            
            Text(diary.diary ?? "")
                .foregroundColor(Color("ebd9fc"))
                .padding(.horizontal)
                .padding(.trailing)
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        .padding(.vertical)
        .fixedSize(horizontal: false, vertical: true)
        .background(Color("252328"))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.3), radius: 1, y: 1)
        .padding(.horizontal)
        .padding(.bottom)
            
    }
}

struct TodayDiary_Previews: PreviewProvider {
    static var previews: some View {
        TodayDiary(diary: Diary(mood: Mood.soHappy, date: Date()))
    }
}
