//
//  DatePickerCalendar.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/28.
//

import SwiftUI
import UIKit
import FSCalendar

struct DatePickerCalendar: View {

    @State var selectedDate: Date = Date()

    var body: some View {
        
        HStack {
            Text("Mon")
                .font(.system(size: 10))
                .foregroundColor(Color("d4bbfc"))
                .frame(maxWidth: .infinity)
            Text("Tue")
                .font(.system(size: 10))
                .foregroundColor(Color("d4bbfc"))
                .frame(maxWidth: .infinity)
            Text("Wed")
                .font(.system(size: 10))
                .foregroundColor(Color("d4bbfc"))
                .frame(maxWidth: .infinity)
            Text("Thu")
                .font(.system(size: 10))
                .foregroundColor(Color("d4bbfc"))
                .frame(maxWidth: .infinity)
            Text("Fri")
                .font(.system(size: 10))
                .foregroundColor(Color("d4bbfc"))
                .frame(maxWidth: .infinity)
            Text("Sat")
                .font(.system(size: 10))
                .foregroundColor(Color("d4bbfc"))
                .frame(maxWidth: .infinity)
            Text("Sun")
                .font(.system(size: 10))
                .foregroundColor(Color("d4bbfc"))
                .frame(maxWidth: .infinity)
        }
        .padding(.top)
        .padding(.horizontal, 5)
        .frame(maxWidth: .infinity)
        
        CalendarViewRepresentable(selectedDate: $selectedDate)
            .frame(height: 400, alignment: .top)
            .padding(.bottom)
            .background(Color("18171D"))
    }
}

struct CalendarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar

    fileprivate var calendar = FSCalendar()
    @Binding var selectedDate: Date

    func makeUIView(context: Context) -> FSCalendar {
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
       
        
        calendar.scrollEnabled = false
        calendar.pagingEnabled = false
        calendar.isUserInteractionEnabled = false
        calendar.clipsToBounds = true
        
        calendar.scope = .month
        calendar.placeholderType = .none
        calendar.firstWeekday = 2

        // Added the below code to change calendar appearance
        calendar.appearance.todayColor = .none
        calendar.today = nil
        calendar.appearance.selectionColor = nil
        
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.headerHeight = 0
        
        calendar.weekdayHeight = 0
        
        calendar.appearance.titleDefaultColor = UIColor(named: "d4bbfc")
        calendar.appearance.titleFont = .systemFont(ofSize: 10)
        calendar.appearance.titleOffset = .init(x:0, y: -15)
        calendar.rowHeight = 40


        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject,
          FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarViewRepresentable

        init(_ parent: CalendarViewRepresentable) {
            self.parent = parent
        }
        
        //do something when a date is selected
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
        }

        //image for days
        func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
            if noRecord(date: date) {
                let image = UIImage(named: "null")
                let targetSize = CGSize(width: 30, height: 30)

                let scaledImage = image?.scalePreservingAspectRatio(
                    targetSize: targetSize
                )
                return scaledImage
                   
            } else {
                let image = UIImage(named: "null")
                let targetSize = CGSize(width: 30, height: 30)

                let scaledImage = image?.scalePreservingAspectRatio(
                    targetSize: targetSize
                )
                return scaledImage
            }
            
        }
        

        func maximumDate(for calendar: FSCalendar) -> Date {
            Date.now.addingTimeInterval(86400 * 10000)
        }

        func minimumDate(for calendar: FSCalendar) -> Date {
            Date.now.addingTimeInterval(-86400 * 10000)
        }
    }
}
                        
func noRecord(date : Date) -> Bool {
    let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "EEEE"
       let day: String = dateFormatter.string(from: date)
       if day == "Saturday" || day == "Sunday" {
           return true
       }
       return false
}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}


struct DatePickerCalendar_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerCalendar()
    }
}
