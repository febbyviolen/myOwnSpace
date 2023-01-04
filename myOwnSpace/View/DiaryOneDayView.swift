//
//  DiaryOneDayView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/04.
//

import SwiftUI

struct DiaryOneDayView: View {
    var body: some View {
        HStack{
            VStack{
                Text("9")
                    .bold()
                    .foregroundColor(Color("ebd9fc"))
                Text("Jan")
                    .bold()
                    .foregroundColor(Color("ebd9fc"))
                Spacer()
                
                Text("Moods: 10")
                    .font(.subheadline)
                    .foregroundColor(Color("ebd9fc"))
                Text("Stories: 10")
                    .font(.subheadline)
                    .foregroundColor(Color("ebd9fc"))
            }
            .padding(.horizontal)
            .padding(.leading)
            
            Divider()
                .overlay(Color("ebd9fc"))
            
            VStack(alignment: .leading){
                Image("null")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, alignment: .leading)
                    .padding(.horizontal)
                Divider()
                    .overlay(Color("ebd9fc"))
                Text("07:00 \nhello my name is who? do you know who I am?? hello my name is like you know i dont know... ")
                    .font(.subheadline)
                    .lineLimit(3)
                    .foregroundColor(Color("ebd9fc"))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.trailing)
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

struct DiaryOneDayView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryOneDayView()
    }
}
