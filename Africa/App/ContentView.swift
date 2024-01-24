//
//  ContentView.swift
//  Africa
//
//  Created by Y K on 24.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView {
                List {
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, 
                                                  leading: 0,
                                                  bottom: 0,
                                                  trailing: 0))
                
            }
                .navigationTitle("Africa")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
