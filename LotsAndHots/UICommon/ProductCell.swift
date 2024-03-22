//
//  ProductSell.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-22.
//

import SwiftUI

struct ProductCell: View {
    // MARK: - PROPERTY
    @State var pObj: ProductModel = ProductModel(dict: [:])
    @State var width:Double = 180.0
    var didAddCart: ( ()->() )?
    
    // MARK: - BODY
    var body: some View {
        
        VStack{
            WebImage(url: URL(string: pObj.image ))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 100, height: 80)
            
            Spacer()
            
            Text(pObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Text("\(pObj.unitValue)\(pObj.unitName), price")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack {
                Text("$\(pObj.offerPrice ?? pObj.price, specifier: "%.2f" )")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button {
                    
                    didAddCart?()
                } label: {
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 40, height: 40)
                .background( Color.primaryApp)
                .cornerRadius(15)
            }
            
            
        }
        .padding(15)
        .frame(width: 180, height: 230)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
        )
    }
}

// MARK: - PREVIEW
struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell()
    }
}
