//
//  TimeCounter.swift
//  DataFlowSwiftUIHW
//
//  Created by Кирилл Нескоромный on 09.06.2021.
//

import Foundation
// нужен, чтобы подписать под ObservableObject
import Combine

// подписываем под протокол для дальнейшей иниц свойства objectWillChange
class TimeCounter: ObservableObject {
    // позволяет отправлять обновленные состояния класса в то окружение, где этот класс используется, отправляет подписчику весь измненный класс целиком
    let objectWillChange = PassthroughSubject<TimeCounter, Never>() // Never - не обрабатываем ошибки
    
    var counter = 3
    // создали переменную
    var timer: Timer?
    var buttonTitle = "Start"
    
    //
    func startTimer() {
        if counter > 0 {
            // инициализируем переменную классом Timer
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                // где будет работать метод
                target: self,
                // какой метод будет работать
                selector: #selector(updateCounter),
                userInfo: nil,
                // отвечает за повторы
                repeats: true
            )
        }
        // меняем тайтл
        buttonDidTapped()
    }
    // логика таймера, меняющая состояние класса (здесь меняются свойства)
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            // завершаем таймер
            killTimer()
            // меняем тайтл кнопки
            buttonTitle = "Reset"
        }
        // после выполнения логики необходимо уведомить окружение об изменении свойств
        objectWillChange.send(self)
    }
    // метод завершающий таймер
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    // метод, меняющий тайтл
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        // после выполнения логики необходимо уведомить окружение об изменении свойств
        objectWillChange.send(self)
    }
}
