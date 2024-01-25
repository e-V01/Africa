//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Y K on 25.01.2024.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: Animal
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(animal.link, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                        
                    
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundStyle(.accent)
            }
        }
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
