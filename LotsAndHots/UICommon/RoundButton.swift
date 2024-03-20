//
//  RoundButton.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-20.
//

import SwiftUI

struct RoundButton: View {
    // MARK: - PROPERTY
    @State var title: String = "Tittle"
    var didTap: (()->())?
    
    // MARK: - BODY
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.primaryApp)
        .cornerRadius(20)
    }
}

// MARK: - PREVIEW

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}

