//
//  HomeView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/31.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            HStack {
                HStack(alignment: .center){
                    Image(systemName: "circle.fill")
                    .foregroundColor(.yellow)
                    Text("500")
                        .foregroundColor(Color("f2ebfb"))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text(dateToString(str:Date()))
                    .bold()
                    .foregroundColor(Color("d4bbfc"))
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("f2ebfb"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .opacity(0)
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            ScrollView(){
                DatePickerCalendar()
                TodayDiary(diary: Diary(mood: Mood(moodState: .happy, moodImage: .happyImage), date: Date()))
                Spacer(minLength: 100)
            }
            
            
        }
        
        .background(Color("18171D"))
    }
    
    func dateToString(str: Date) -> String{
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "MMM yyyy"
        return (formatter3.string(from: str))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
