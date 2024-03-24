//
//  CartViewModel.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-24.
//

import SwiftUI

class CartViewModel: ObservableObject
{
    
    static var shared: CartViewModel = CartViewModel()
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    
    init() {
              serviceCallList()
    }
    
    // MARK: - SERVICE CALL
    
    func serviceCallList() {
        
        ServiceCall.post(parameter: [:], path: Globs.SV_FAVORITE_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
                    })
                    
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
}
