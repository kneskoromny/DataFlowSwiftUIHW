//
//  UserManager.swift
//  DataFlowSwiftUIHW
//
//  Created by Кирилл Нескоромный on 09.06.2021.
//

import SwiftUI

// почитал в группе про @AppStorage, поискал, но чет не разобрался как сделать, оставил так
class UserManager: ObservableObject {
    
    @Published var isRegister = UserDefaults.standard.bool(forKey: "Register")
    // с именем такой способ работает, но он точно неправильный, как сделать нормально - хз
    var name = UserDefaults.standard.string(forKey: "Name") ?? ""
}
