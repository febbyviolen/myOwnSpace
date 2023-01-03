//
//  TodayDiary.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/30.
//

import SwiftUI

struct TodayDiary: View {
    var body: some View {
        HStack{
            VStack(spacing: 5){
                Text("9")
                    .bold()
                    .foregroundColor(Color("ebd9fc"))
                
                Text("07:00")
                    .font(.subheadline)
                    .foregroundColor(Color("d4bbfc"))
                
                Image("null")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    
                Spacer()
            }
            .padding(.horizontal)
            .padding(.horizontal)
            
            
            Divider()
                .overlay(Color("ebd9fc"))
            
            Text("hello my name is who? do you know who I am?? hello my")
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
        TodayDiary()
    }
}
