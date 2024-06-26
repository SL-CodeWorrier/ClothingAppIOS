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
        
        ZStack {
            
                
                if(homeVM.selectTab == 0) {
                    HomeView()
                }else if(homeVM.selectTab == 1) {
                    ExploreView()
                }else if(homeVM.selectTab == 2) {
                    MyCartView()
                }else if(homeVM.selectTab == 3) {
                    FavouriteView()
                }else if(homeVM.selectTab == 4) {
                    ExploreView()
                }

            VStack {
                
                Spacer()
                
                HStack {
                    
                    TabButton(title: "Shop", icon: "shop_tab", isSelect: homeVM.selectTab == 0) {
                        
                        print("Button Tab")
                        
                        DispatchQueue.main.async {
                            
                            withAnimation {
                                homeVM.selectTab = 0
                            }
                        }
                    }
                    
                    TabButton(title: "Explore", icon: "explore_tab", isSelect: homeVM.selectTab == 1) {
                        DispatchQueue.main.async {
                            
                            withAnimation {
                                homeVM.selectTab = 1
                            }
                        }
                    }
                    
                    TabButton(title: "Cart", icon: "cart_tab", isSelect: homeVM.selectTab == 2) {
                        DispatchQueue.main.async {
                            
                            withAnimation {
                                homeVM.selectTab = 2
                            }
                        }
                    }
                    
                    TabButton(title: "Favourite", icon: "favourite_tab", isSelect: homeVM.selectTab == 3) {
                        DispatchQueue.main.async {
                            
                            withAnimation {
                                homeVM.selectTab = 3
                            }
                        }
                    }
                
                    TabButton(title: "Account", icon: "account_tab", isSelect: homeVM.selectTab == 4) {
                        DispatchQueue.main.async {
                            
                            withAnimation {
                                homeVM.selectTab = 4
                            }
                        }
                    }
                    
                }
                .padding(.top, 10)
                .padding(.bottom, .bottomInsets)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)

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
 
