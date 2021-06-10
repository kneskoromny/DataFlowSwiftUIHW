//
//  RegisterButton.swift
//  DataFlowSwiftUIHW
//
//  Created by Кирилл Нескоромный on 10.06.2021.
//

import SwiftUI

struct RegisterButton: View {
    
    let name: String
    let minimumInputCount: Bool
    
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Button(action: registerUser) {
            HStack {
                Image(systemName: "checkmark.circle")
                Text("OK")
            }
        }
        .disabled(!minimumInputCount)
    }
    
    private func registerUser() {
        if minimumInputCount == true {
            user.name = name
            UserDefaults.standard.setValue(user.name, forKey: "Name")
            user.isRegister.toggle()
            UserDefaults.standard.setValue(user.isRegister, forKey: "Register")
        }
    }
}

struct RegisterButton_Previews: PreviewProvider {
    static var previews: some View {
        RegisterButton(name: "Tim", minimumInputCount: true)
    }
}
