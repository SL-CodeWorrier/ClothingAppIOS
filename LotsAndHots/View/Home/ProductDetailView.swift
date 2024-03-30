//
//  ProductDetailView.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]) )
   
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                ZStack {
                    Rectangle()
                      .foregroundColor( Color(hex: "F2F2F2") )
                      .frame(width: .screenWidth, height: .screenWidth * 0.8)
                      .cornerRadius(20, corner: [.bottomLeft, .bottomRight])
                  
                  WebImage(url: URL(string: detailVM.pObj.image ))
                      .resizable()
                      .indicator(.activity) // Activity Indicator
                      .transition(.fade(duration: 0.5))
                      .scaledToFit()
                      .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
                }
                .frame(width: .screenWidth, height: .screenWidth * 0.8)
                
                VStack {
                    HStack {
                        
                        Text(detailVM.pObj.name)
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            detailVM.serviceCallAddRemoveFav()
                        } label: {
                            
                            Image( detailVM.isFav ? "favourite" : "fav"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(Color.secondaryText)
                        
                    }
                    Text("\(detailVM.pObj.unitValue), Price")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        Button {
                            detailVM.addSubQTY(isAdd: false)
                        } label: {
                            
                            Image( "subtack"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Text( "\(detailVM.qty)" )
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
                            )
                        
                        
                        Button {
                            detailVM.addSubQTY(isAdd: true)
                        } label: {
                            
                            Image( "add_green"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        
                        Spacer()
                        Text( "$\(  (detailVM.pObj.offerPrice ?? detailVM.pObj.price) * Double(detailVM.qty) , specifier: "%.2f")"  )
                            .font(.customfont(.bold, fontSize: 28))
                            .foregroundColor(.primaryText)
                    }
                    .padding(.vertical, 8)
                                        
                    Divider()
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                VStack {
                    HStack {
                        Text("Product Detail")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            withAnimation {
                                detailVM.showDetail()
                            }
                            
                        } label: {
                            
                            Image( detailVM.isShowDetail ? "detail_open" : "next"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)

                    
                    }
                    
                    if(detailVM.isShowDetail) {
                        Text(detailVM.pObj.detail)
                            .font(.customfont(.medium, fontSize: 13))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom , 8)
                    }
                    
                    Divider()
                    
                }
                .padding(.horizontal, 20)
                
                
                
                HStack {
                    Text("Review")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 2){
                        ForEach( 1...5 , id: \.self) { index in
                            
                            Image(systemName:  "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor( Color.orange)
                                .frame(width: 15, height: 15)
                                
                        }
                    }
                    
//                    Divider()
                    
                    Button {
                        
                    } label: {
                        
                        Image( "next" )
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(15)
                    }
                    .foregroundColor(Color.primaryText)
                    
                }
                .padding(.horizontal, 20)
                
                RoundButton(title: "Add To Basket") {
//                    CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty - 1)
                    CartViewModel.serviceCallAddToCart(prodId: detailVM.pObj.prodId, qty: detailVM.qty) { isDone, msg  in
                        
                        detailVM.qty = 1
                        
                        self.detailVM.errorMessage = msg
                        self.detailVM.showError = true
                    }
                }
                .padding( 20)
                
            }
            
            
            VStack {
                
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $detailVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("Ok"))  )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: [
            "prod_id": 5,
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
            "is_offer_active": 1
            ])
        ))
    }
}
