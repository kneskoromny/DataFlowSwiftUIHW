//
//  DataFlowSwiftUIHWApp.swift
//  DataFlowSwiftUIHW
//
//  Created by Кирилл Нескоромный on 09.06.2021.
//

import SwiftUI

@main
struct DataFlowSwiftUIHWApp: App {
    
    @StateObject private var user = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}
