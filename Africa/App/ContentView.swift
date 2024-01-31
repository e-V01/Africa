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
    
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number \(gridColumn)")
        
        //toolbar Icon
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    // : Example
//    If gridLayout.count is 10, then gridLayout.count % 3 is 1, and adding 1 gives 2.
//    If gridLayout.count is 2, then gridLayout.count % 3 is 2, and adding 1 gives 3.
//    In summary, this expression effectively cycles the values 1, 2, and 3 based on the current count of elements in the gridLayout array
    
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
                            
                            CreditsView()
                                .modifier(CenterModifier())
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
                            .animation(.easeIn(duration: 0.5))
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
                                    gridSwitch()
                                } label: {
                                    Image(systemName: toolbarIcon)
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
