//
//  HomeView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/31.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var moodModelController: MoodModelController
//    @Binding var show : Bool
    
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
                DatePickerCalendar(selectedDate: Date())
                ForEach(self.moodModelController.diarys, id:\.id){diary in
                    TodayDiary(diary: diary)
                }
                .onDelete { (index) in
                    self.moodModelController.deleteDiary(at: index)
                }
                Spacer(minLength: 100)
            }
            .onAppear{
                moodModelController.loadFromPersistentStore()
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
        HomeView(moodModelController: MoodModelController())
    }
}
