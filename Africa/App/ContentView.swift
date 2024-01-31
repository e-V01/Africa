//
//  ContentView.swift
//  Africa
//
//  Created by Y K on 24.01.2024.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
            NavigationView {
                
                Group {
                    if !isGridViewActive {
                        List {
                            CoverImageView()
                                .frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0,
                                                          leading: 0,
                                                          bottom: 0,
                                                          trailing: 0))
                            ForEach(animals) { animal in
                                NavigationLink(destination:
                                                AnimalDetailView(animal: animal)) {
                                    AnimalListItemView(animal: animal)
                                }
                            }
                        }
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                                ForEach(animals) { animal in
                                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                        AnimalGridItemView(animal: animal)
                                    }
                                }
                            }
                            .padding()
                            .animation(.easeIn(duration: 1))
                        }
                    } // condition
                }// list
                    .navigationTitle("Africa")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack(spacing: 16) {
                                // LIST
                                Button {
                                    print("List")
                                    isGridViewActive = false
                                    haptics.impactOccurred()
                                } label: {
                                    Image(systemName: "square.fill.text.grid.1x2")
                                        .font(.title2)
                                        .foregroundStyle(isGridViewActive ? .primary : Color.accentColor)
                                }
                                
                                // GRID
                                Button {
                                    print("Grid")
                                    isGridViewActive = true
                                    haptics.impactOccurred()
                                } label: {
                                    Image(systemName: "square.grid.2x2")
                                        .font(.title2)
                                        .foregroundStyle(isGridViewActive ? Color.accentColor : .primary)
                                }
                            }
                        }
                }
                
        }
    }
}

#Preview {
    ContentView()
}
