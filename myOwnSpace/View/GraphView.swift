//
//  GraphView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/04.
//

import SwiftUI
import Charts

struct GraphView: View {
    var body: some View {
        VStack(spacing: 50){
            Chart(data) {
                LineMark(
                    x: .value("Mount", $0.type.rawValue),
                    y: .value("Value", $0.count.rawValue)
                )
                PointMark(
                    x: .value("Mount", $0.type.rawValue),
                    y: .value("Value", $0.count.rawValue)
                )
                
            }
            .frame(maxWidth: .infinity, maxHeight: 350)
            .environment(\.colorScheme, .dark)
            .foregroundColor(Color("B28BF5"))
            
            
            Chart(data) { data in
                BarMark(
                    x: .value("Mount", data.student),
                    y: .value("Value", data.count.rawValue)
                )
                .foregroundStyle(by: .value("Count", data.type.rawValue))
    
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
        GraphView()
    }
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
    case uIKit = "UIKit"
    case swiftUI = "SwiftUI"
    case machineLearning = "Machine Learning"
}
