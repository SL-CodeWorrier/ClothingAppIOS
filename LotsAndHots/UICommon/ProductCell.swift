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
                .background(Color.primaryApp)
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
        ProductCell(pObj: ProductModel(dict: ["offer_price": 2.49,
                                              "start_date": "2023-07-30T18:30:00.000Z",
                                              "end_date": "2023-08-29T18:30:00.000Z",
                                              "prod_id": 5,
                                              "cat_id": 1,
                                              "brand_id": 1,
                                              "type_id": 1,
                                              "name": "Shirt",
                                              "detail": "banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year",
//                                              "unit_name": "pcs",
                                              "unit_value": "7",
//                                              "nutrition_weight": "200g",
                                              "price": 2.99,
                                              "image": "http://localhost:3001/img/product/shirt1.png",
                                              "cat_name": "Shirt",
                                              "type_name": "bag",
                                              "is_fav": 1])) {
            
        }
    }
}
