//
//  SettingView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2023/01/05.
//

import SwiftUI

struct SettingView: View {
    
    @State var passwordOn = false

    
    var body: some View {
        VStack(spacing: 20){
            Text("Setting")
                .frame(maxWidth:.infinity, alignment: .center)
                .foregroundColor(Color("ebd9fc"))
                .bold()
                .font(.title3)
            
            Text("General")
                .frame(maxWidth:.infinity, alignment: .leading)
                .foregroundColor(Color("ebd9fc"))
            
            HStack{
                Text("Passcode")
                
                Toggle("", isOn: $passwordOn)
                    .toggleStyle(SwitchToggleStyle(tint: Color("9667e0")))
            }
            .padding()
            .foregroundColor(Color("ebd9fc"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("252328"))
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .background(Color("18171D"))
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
