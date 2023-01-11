//
//  DiaryView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/04.
//

import SwiftUI

struct DiaryView: View {
    @State var selectedDate = Date()
//    @State private var calendarId: Int = 0
    
    var body: some View {
        VStack(spacing: 20){
            DatePicker("Date: ", selection: $selectedDate, in: ...Date(), displayedComponents: [.date])
//                .id(calendarId)
//                .onChange(of: selectedDate, perform: { _ in
//                  calendarId += 1
//                })
//                .onTapGesture {
//                  calendarId += 1
//                }
                .padding(.horizontal)
                .padding(.top)
                .datePickerStyle(.compact)
                .foregroundColor(Color("ebd9fc"))
                .bold()
                .environment(\.colorScheme, .dark)
                
            
            Divider()
                .overlay(Color("ebd9fc"))
            
            ScrollView{
                DiaryOneDayView(diarys: [Diary(mood: .soHappy, date: Date()), Diary(mood: .soHappy, date: Date())])
            }
        }
        .background(Color("18171D"))
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
