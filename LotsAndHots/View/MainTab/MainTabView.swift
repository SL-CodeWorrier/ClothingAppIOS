//
//  MainTabView.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-21.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - PROPERTY
    
    
    // MARK: - BODY
    
    var body: some View {
        
        ZStack {
            VStack {
//                Spacer()
                
                HStack {
                    Button {
                        MainViewModel.shared.isUserLogin = false
                    } label: {
                        Text("Logout")
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

// MARK: - PREVIEW

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainTabView()
        }
    }
}
 
