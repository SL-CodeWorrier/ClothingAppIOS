//
//  LotsAndHotsApp.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-20.
//

import SwiftUI

@main
struct LotsAndHotsApp: App {
    @StateObject var mainVM = MainViewModel.shared
        
        var body: some Scene {
            WindowGroup {
                
                NavigationView {
                    
                    if mainVM.isUserLogin {
                        MainTabView()
                    }else{
                        WelcomeView()
                    }
                }
                
            }
        }
}
