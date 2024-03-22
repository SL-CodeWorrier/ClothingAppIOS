//
//  HomeViewModel.swift
//  LotsAndHots
//
//  Created by Chathura Aththanayaka on 2024-03-21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectTab: Int = 0
    @State var selected : Int = 0
}


