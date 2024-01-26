//
//  GalleryView.swift
//  Africa
//
//  Created by Y K on 24.01.2024.
//

import SwiftUI

struct GalleryView: View {
    // simple grid def
    let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
