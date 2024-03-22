//
//  MainTabView.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-21.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - PROPERTY
    @StateObject var homeVM = HomeViewModel.shared
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack {
            
            TabView(selection: $homeVM.selectTab) {
                HomeView().tag(0)
                ExploreView().tag(1)
                ExploreView().tag(2)
                ExploreView().tag(3)
                ExploreView().tag(4)
            }
            .onAppear{
                UIScrollView.appearance().isScrollEnabled = false
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeVM.selectTab) { newValue in
                debugPrint("Sel Tab :\(newValue)")
            }
            
            HStack {
                Button {
                    
                } label: {
                    VStack {
                        Image("")
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
        MainTabView()
    }
}
 
