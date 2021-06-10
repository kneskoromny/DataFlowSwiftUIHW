//
//  ContentView.swift
//  DataFlowSwiftUIHW
//
//  Created by Кирилл Нескоромный on 09.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var user: UserManager
    
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)!")
                .font(.largeTitle)
                .offset(x: 0, y: 50)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 75)
            Spacer()
            
            ButtonLaunchTimer(timer: timer)
            
            Spacer()
            
            ButtonLogout()
            
            Spacer()
            
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonLaunchTimer: View {
    
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        
        Button(action: timer.startTimer) {
            
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ButtonLogout: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Button(action: logOut) {
            Text("LogOut")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
    private func logOut() {
        user.isRegister.toggle()
        UserDefaults.standard.setValue(user.isRegister, forKey: "Register")
        UserDefaults.standard.setValue("", forKey: "Name")
    }
}
