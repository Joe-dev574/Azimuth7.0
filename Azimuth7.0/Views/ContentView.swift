//
//  ContentView.swift
//  Azimuth7.0
//
//  Created by Joseph DeWeese on 9/9/24.
//

import SwiftUI

struct ContentView: View {
    ///visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    
    var body: some View {
        TabBarHome()
    }
}

#Preview {
    ContentView()
}
