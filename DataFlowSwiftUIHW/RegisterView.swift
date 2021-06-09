//
//  RegisterView.swift
//  DataFlowSwiftUIHW
//
//  Created by Кирилл Нескоромный on 09.06.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var name = ""
    @State private var inputCount = "0"
    @State private var inputCountColor = Color.red
    
    @State private var minimumInputCount = false
    
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Type your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { name in
                        inputCount = String(name.count)
                        
                        if Double(inputCount) == 3 {
                            inputCountColor = .green
                            minimumInputCount.toggle()
                        }
                    }
                TextView(inputCount: inputCount, color: inputCountColor)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!minimumInputCount)
        }
        .padding()
    }
    
    private func registerUser() {
        if minimumInputCount == true {
            user.name = name
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}



struct TextView: View {
    
    var inputCount: String
    var color: Color
    
    var body: some View {
        Text(inputCount)
            .foregroundColor(color)
    }
}
