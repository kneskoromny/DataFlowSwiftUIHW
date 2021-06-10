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
                
                InputTextField(
                    name: $name,
                    inputCount: $inputCount,
                    inputCountColor: $inputCountColor,
                    minimumInputCount: $minimumInputCount
                )
                
                TextView(inputCount: inputCount, color: inputCountColor)
            }
            
            RegisterButton(name: name, minimumInputCount: minimumInputCount)
        }
        .padding()
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


