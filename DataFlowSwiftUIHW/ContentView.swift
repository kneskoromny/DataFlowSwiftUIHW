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
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 150)
            Spacer()
            
            ButtonView(timer: timer)
            
            Spacer()
            
            Button(action: {}) {
                Text("LogOut")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            // сама кнопка
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 4)
            )
            
            Spacer()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    // создаем таймер для инициализации в родительском view и задания действий при нажатии кнопки. @ObservedOblect - ссылка на родительский экземпляр класса, то же что и @Binding, но для класса
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        // задаем запуск таймера при нажатии
        Button(action: timer.startTimer) {
            // текст кнопки
            // меняем тайтл согласно состоянию таймера
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        // сама кнопка
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}
