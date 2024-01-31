//
//  CenterModifier.swift
//  Africa
//
//  Created by Y K on 31.01.2024.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
