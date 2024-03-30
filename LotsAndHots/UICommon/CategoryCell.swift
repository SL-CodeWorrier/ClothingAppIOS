//
//  CategoryCell.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCell: View {
    // MARK: - PROPERTY
    @State var tObj: TypeModel = TypeModel(dict: [ : ])
    @State var color: Color = Color.yellow
    var didAddCart: ( ()->() )?
    
    // MARK: - BODY
    var body: some View {
        HStack{
            
            WebImage(url: URL(string: tObj.image ))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            Text(tObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
//            Text("Watch")
//                .font(.customfont(.bold, fontSize: 16))
//                .foregroundColor(.primaryText)
//                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
            
            
//            
//        
//            
            
            
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background( tObj.color.opacity(0.3) )
        .cornerRadius(16)
    }
}

// MARK: - PREVIEW

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(tObj: TypeModel(dict: [ "type_id": 1,
                                             "type_name": "Small",
                                             "image": "http://localhost:3001/img/type/20240327130249249uJajVK77RI.png",
                                             "color": "F8A44C" ]))
    }
}
