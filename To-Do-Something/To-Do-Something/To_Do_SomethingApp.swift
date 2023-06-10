//
//  To_Do_SomethingApp.swift
//  To-Do-Something
//
//  Created by Tien Anh Tran Duc on 10/06/2023.
//

import SwiftUI

@main
struct To_Do_SomethingApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
