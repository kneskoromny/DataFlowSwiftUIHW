//
//  InputTextFieldView.swift
//  DataFlowSwiftUIHW
//
//  Created by Кирилл Нескоромный on 10.06.2021.
//

import SwiftUI

struct InputTextField: View {
    
    @Binding var name: String
    @Binding var inputCount: String
    @Binding var inputCountColor: Color
    @Binding var minimumInputCount: Bool
    
    var body: some View {
        TextField("Type your name...", text: $name)
            .multilineTextAlignment(.center)
            .onChange(of: name) { name in
                inputCount = String(name.count)
                
               allowRegister()
            }
    }
    
    private func allowRegister() {
        if Double(inputCount) == 3 {
            inputCountColor = .green
            minimumInputCount.toggle()
        }
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextField(name: .constant("Tim"), inputCount: .constant("3"), inputCountColor: .constant(.green), minimumInputCount: .constant(true))
    }
}
