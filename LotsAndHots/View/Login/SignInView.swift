//
//  SigninView.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-20.
//

import SwiftUI

struct SignInView: View {
    // MARK: - PROPERTY
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            Image("")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenWidth)
            
            
            
            VStack {
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth - 50)
                
                Spacer()
            }
            
            ScrollView {
                
                VStack {
                    Text("Step into style: Your ultimate fashion destination awaits!")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 25)
                    
                    
                }
                .padding(.horizontal, 25)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth * 0.55)
            }
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

// MARK: - PREVIEW

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

