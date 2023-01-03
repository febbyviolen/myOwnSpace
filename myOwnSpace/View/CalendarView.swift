//
//  CalendarView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/18.
//

import SwiftUI

struct CalendarView: View {
    
    @State var selectedDate : Date = Date()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                .font(.system(size: 28))
                .bold()
                .foregroundColor(Color.accentColor)
                .padding()
                .animation(.spring(), value: selectedDate)
                .frame(width: 500)
            Divider().frame(height: 1)
            DatePicker("Selected date", selection: $selectedDate, displayedComponents: [.date])
                .padding(.horizontal)
                .datePickerStyle(.graphical)
            Divider()
        }
        .padding(.vertical, 100)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
