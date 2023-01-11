//
//  GraphView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/04.
//

import SwiftUI
import Charts

struct GraphView: View {
    
    var diarys: [Diary]
    var graph: [GraphModel]
    let markColors: [Color] = [.pink, .purple, .red, .yellow, .blue]
    
    var body: some View {
        VStack(spacing: 20){
            Text("Mood Board")
                .foregroundColor(Color("ebd9fc"))
                .bold()
                .font(.title3)
                
            HStack{
                Chart(graph) {
                    LineMark(
                        x: .value("Mount", $0.date),
                        y: .value("Value", $0.value)
                    )
                    PointMark(
                        x: .value("Mount", $0.date),
                        y: .value("Value", $0.value)
                    )
                    
                }
                .chartYScale(domain: 0...5)
                .chartYAxis(.hidden)
                .environment(\.colorScheme, .dark)
                .foregroundColor(Color("B28BF5"))
                .padding(.top)
                .padding(.bottom)
                
                VStack(spacing: 20){
                    Image(Mood.soHappy.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, alignment: .trailing)
                    Image(Mood.happy.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, alignment: .trailing)
                    Image(Mood.okay.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, alignment: .trailing)
                    Image(Mood.sad.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, alignment: .trailing)
                    Image(Mood.angry.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, alignment: .trailing)
                    Spacer()

                }
                
                .frame(maxHeight: .infinity)
                .padding(.bottom, 0)
                .padding(.leading)
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            
            
            
            Text("This month mood stack")
                .foregroundColor(Color("ebd9fc"))
                .font(.subheadline)
                .bold()
                .padding(.top)
            
            Chart(diarys) { data in
                BarMark(
                    x: .value("Count", diarys.count),
                    y: .value("Value", data.timeRange.rawValue)
                )
                .foregroundStyle(by: .value("Count", data.mood.rawValue))
                
            }
            .frame(maxWidth: .infinity, maxHeight: 150)
            .environment(\.colorScheme, .dark)
            .foregroundColor(Color("B28BF5"))
            
            Spacer()
            
        }
        .padding()
        .background(Color("18171D"))
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(diarys: [Diary(mood: .soHappy, date: Date()), Diary(mood: Mood.sad, date: Date())], graph: [GraphModel(date: dateToy(), value: 3), GraphModel(date: Date(), value: 1)])
    }
}

func dateToy() -> Date{
    let isoDate = "2016-04-14T10:44:00+0000"

    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from:isoDate)!
    
    return date
}

struct ToyShape: Identifiable {
    var type: mood
    var count: mood2
    var student: Double
    var id = UUID()
}

var data: [ToyShape] = [
    .init(type: .uIKit , count: .swiftUI, student: 9),
    .init(type: .swiftUI , count: .swiftUI, student: 7),
    .init(type: .machineLearning , count: .swiftUI, student: 5)
]

enum mood: String {
    case uIKit = "UIKit"
    case swiftUI = "SwiftUI"
    case machineLearning = "Machine Learning"
}

enum mood2: String {
    case swiftUI = "SwiftUI"
}
