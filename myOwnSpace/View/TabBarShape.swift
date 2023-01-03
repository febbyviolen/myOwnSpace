//
//  TabBarShape.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/30.
//

import SwiftUI

struct TabBarShape: Shape {

    private enum Constants {
        static let cornerRadius: CGFloat = 20
        static let buttonRadius: CGFloat = 30
        static let buttonPadding: CGFloat = 5
    }
    
    func path(in rect: CGRect) -> Path {
          return Path{path in
              path.move(to: CGPoint(x: 0, y: 0))
              path.addLine(to: CGPoint(x: rect.width, y: 0))
              path.addLine(to: CGPoint(x: rect.width, y: rect.height))
              path.addLine(to: CGPoint(x: 0, y: rect.height))
              
              
              // MARK: = CURVE CENTER
              let mid = rect.width / 2

              path.move(to: CGPoint(x: mid - 80, y:0))

              let to1 = CGPoint(x: mid, y: 45)
              let control1 = CGPoint(x: mid - 35, y: 0)
              let control2 = CGPoint(x: mid - 35, y: 45)

              path.addCurve(to: to1, control1: control1, control2: control2)

              let to2 = CGPoint(x: mid + 80, y: 0)
              let control3 = CGPoint(x: mid + 35, y: 45)
              let control4 = CGPoint(x: mid + 35, y: 0)

              path.addCurve(to: to2, control1: control3, control2: control4)
          }
      }
  }


struct TabBarShape_Previews: PreviewProvider {
    static var previews: some View {
        TabBarShape()
    }
}
