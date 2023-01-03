//
//  AddNewDiary.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/01.
//

import SwiftUI

struct AddNewDiary: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "chevron.left")
                    .foregroundColor(Color("ebd9fc"))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("July 3, 2021")
                    .foregroundColor(Color("ebd9fc"))
                    .frame(maxWidth: .infinity)
                
                Text("save")
                    .foregroundColor(Color("ebd9fc"))
                    .padding(5)
                    .padding(.horizontal, 5)
                    .background(Color("B28BF5"))
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }.padding(.horizontal)
            
            VStack{
                Text("How was your day?")
                    .foregroundColor(Color("ebd9fc"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(){
                    Image("null")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("ebd9fc"))
                        .frame(maxWidth: 30)
                    Spacer()
                    Image("null")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("ebd9fc"))
                        .frame(maxWidth: 30)
                    Spacer()
                    Image("null")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("ebd9fc"))
                        .frame(maxWidth: 30)
                    Spacer()
                    Image("null")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("ebd9fc"))
                        .frame(maxWidth: 30)
                    Spacer()
                    Image("null")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("ebd9fc"))
                        .frame(maxWidth: 30)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            .padding(.horizontal)
            .fixedSize(horizontal: false, vertical: true)
            .background(Color("252328"))
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 1, y: 1)
            .padding(.horizontal)
            .padding(.bottom)
            
            VStack(spacing: 15){
                Text("Write about today")
                    .foregroundColor(Color("ebd9fc"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .overlay {
                        Color("ebd9fc")
                    }
                
                Text("this is where you write your story nanti ganti jadi itu yaaaaaaaaa")
                    .foregroundColor(Color("ebd9fc"))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            .padding(.horizontal)
            .fixedSize(horizontal: false, vertical: true)
            .background(Color("252328"))
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 1, y: 1)
            .padding(.horizontal)
            .padding(.bottom)
            
            VStack{
                Text("Voice diary")
                    .foregroundColor(Color("ebd9fc"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Image(systemName: "record.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("B28BF5"))
                    .frame(maxWidth: 50)
            }
            .padding(.vertical)
            .padding(.horizontal)
            .fixedSize(horizontal: false, vertical: true)
            .background(Color("252328"))
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 1, y: 1)
            .padding(.horizontal)
            .padding(.bottom)
            
            
        }
        .padding(.vertical)
        .background(Color("18171D"))
    
    }
}

struct AddNewDiary_Previews: PreviewProvider {
    static var previews: some View {
        AddNewDiary()
    }
}
