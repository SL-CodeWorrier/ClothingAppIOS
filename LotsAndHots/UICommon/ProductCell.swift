//
//  ProductSell.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductCell: View {
    // MARK: - PROPERTY
    
    @State var pObj: ProductModel = ProductModel(dict: [:])
    @State var width:Double = 180.0
    var didAddCart: ( ()->() )?
    
    // MARK: - BODY
    
    var body: some View {
        NavigationLink {
            ProductDetailView(detailVM:  ProductDetailViewModel(prodObj: pObj) )
        } label: {
            
            
            VStack{
                
                WebImage(url: URL(string: pObj.image ))
                    .resizable()
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                
                    .frame(width: 150, height: 150)
                
                
                
                Spacer()
                
                Text(pObj.name)
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                
                
                Text("\(pObj.unitValue), price")
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
                            .frame(width: 25, height: 25)
                    }
                    .frame(width: 40, height: 40)
                    .background(Color.primaryApp)
                    .cornerRadius(15)
                }
                
                
                
                
            }
            .padding(15)
            .frame(width: width, height: 250)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
            )
        }
    }
}

// MARK: - PREVIEW
struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(pObj: ProductModel(dict: ["prod_id": 5,
                                              "cat_id": 1,
                                              "brand_id": 1,
                                              "type_id": 1,
                                              "name": "Shirt",
                                              "detail": "Selecting the right men's shirt depends on the occasion, your personal style, and comfort preferences. Dress shirts are a must-have for formal events, while casual shirts offer a laid-back yet stylish appearance. Polo shirts and T-shirts are versatile options that can be paired with jeans, chinos, or even shorts for a relaxed ensemble.",
                                              "unit_value": "1",
                                              "price": 5.99,
                                              "created_date": "2024-03-26T17:19:11.000Z",
                                              "modify_date": "2024-03-27T01:20:43.000Z",
                                              "cat_name": "Shirt",
                                              "is_fav": 0,
                                              "brand_name": "bigs",
                                              "type_name": "Small",
                                              "offer_price": 5.99,
                                              "image": "http://localhost:3001/img/product/2024032712383738375GllLZg9Hl.png",
                                              "start_date": "2024-03-27 00:00:00",
                                              "end_date": "2024-04-27 00:00:00",
                                              "is_offer_active": 1])) {
            
        }
    }
}
