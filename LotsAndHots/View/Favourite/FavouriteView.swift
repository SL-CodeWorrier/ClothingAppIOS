//
//  FavouriteView.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteView: View {
    
    @StateObject var favVM = FavouriteViewModel.shared
    
    var body: some View {
        ZStack {
            
            ScrollView{
                LazyVStack {
                    ForEach( favVM.listArr , id: \.id, content: {
                        fObj in
                        
                        FavouriteRow(fObj: fObj)
                        
                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
            
            }
            
            VStack {
                
            }
        }
    }
}

#Preview {
    FavouriteView()
}
