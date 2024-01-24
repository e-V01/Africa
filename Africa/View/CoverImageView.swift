//
//  CoverImageView.swift
//  Africa
//
//  Created by Y K on 24.01.2024.
//

import SwiftUI

struct CoverImageView: View {
    
    
    var body: some View {
        TabView {
            ForEach(0 ..< 5) { item in
                Image("cover-lion")
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
