//
//  AllWinesApp.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

@main
struct AllWinesApp: App {
    @StateObject var vm = WineVM()
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .environmentObject(vm)
    }
}
