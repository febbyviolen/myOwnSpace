//
//  AddNewDiary.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/01.
//

import SwiftUI

struct AddNewDiary: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var moodModelController: MoodModelController
    
    @State var text: String = ""
    @State private var moodState : Mood = .soHappy
    
    
    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(Color("ebd9fc"))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
        }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("How was your day?")
                    .foregroundColor(Color("ebd9fc"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(){
                    Button(action: {
                        self.moodState = .soHappy
                    }, label: {
                        Image("null")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("ebd9fc"))
                            .frame(maxWidth: self.moodState == .soHappy ? 40 : 30)
                    })
                    Spacer()
                    Button(action: {
                        self.moodState = .happy
                    }, label: {
                        Image("null")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("ebd9fc"))
                            .frame(maxWidth: self.moodState == .happy ? 40 : 30)
                    })
                    Spacer()
                    Button(action: {
                        self.moodState = .okay
                    }, label: {
                        Image("null")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("ebd9fc"))
                            .frame(maxWidth: self.moodState == .okay ? 40 : 30)
                    })
                    Spacer()
                    Button(action: {
                        self.moodState = .sad
                    }, label: {
                        Image("null")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("ebd9fc"))
                            .frame(maxWidth: self.moodState == .sad ? 40 : 30)
                    })
                    Spacer()
                    Button(action: {
                        self.moodState = .angry
                    }, label: {
                        Image("null")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("ebd9fc"))
                            .frame(maxWidth: self.moodState == .angry ? 40 : 30)
                    })
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
                
                TextField("", text: $text, axis: .vertical)
                    .foregroundColor(Color("ebd9fc"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tint(Color("ebd9fc"))
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
            
            Button(action: {
                self.moodModelController.createDiary(mood: self.moodState, diaryText: self.text == "" ? nil : self.text, date: Date())
                
                withAnimation {
                    self.presentationMode.wrappedValue.dismiss()
                }
               
            }, label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color("ebd9fc"))
                    .padding(10)
                    .background(Color("B28BF5"))
                    .cornerRadius(5)
            })
            
                .padding(.horizontal)
            
            
            Spacer()
            
            
        }
        .padding(.vertical)
        .background(Color("18171D"))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("12 January, 2023")
                    .foregroundColor(Color("ebd9fc"))
                    .bold()
            }
        }
        
    }
}

struct AddNewDiary_Previews: PreviewProvider {
    static var previews: some View {
        AddNewDiary(moodModelController: MoodModelController())
    }
}
