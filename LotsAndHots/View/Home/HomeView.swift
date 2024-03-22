//
//  HomeView.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-21.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @StateObject var homeVM = HomeViewModel.shared
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    
                    Image("color_logo")
                        .frame(width: 40, height: 20)
                        
                    
                    HStack{
                          
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16 )
                        
                        Text("Uva, Monaragala, Hulandawa")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.darkGray)
                    }
                    
                    SearchTextField(placholder: "Search", txt: $homeVM.txtSearch)
                        .padding()
                    
                }
                .padding(.top, .topInsets )
                
                Image("banner_top")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .padding(.horizontal, 20)
                    .cornerRadius(10)
                
                SectionTitleAll(title: "Exclusive offer", titleAll: "See All") {
                                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.offerArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                
                
                SectionTitleAll(title: "Best Selling", titleAll: "See All") {
                                    
                }
                .padding(.horizontal, 20)
                
                
                ScrollView(.horizontal, showsIndicators: false ) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.bestArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                
                
                SectionTitleAll(title: "Best Selling", titleAll: "See All") {
                                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false ) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.typeArr, id: \.id) {
                            tObj in
                            
                            CategoryCell(tObj: tObj) {
                                
                            }
                        }
                    
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 8)
                
                
                ScrollView(.horizontal, showsIndicators: false ) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.listArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, .bottomInsets + 60)
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

