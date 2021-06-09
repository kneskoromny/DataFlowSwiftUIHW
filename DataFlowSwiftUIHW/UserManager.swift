//
//  UserManager.swift
//  DataFlowSwiftUIHW
//
//  Created by Кирилл Нескоромный on 09.06.2021.
//

import SwiftUI

class UserManager: ObservableObject {
    
    @Published var isRegister = UserDefaults.standard.bool(forKey: "Register")
    
    var name = UserDefaults.standard.string(forKey: "Name") ?? ""
}
