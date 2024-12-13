//
//  ContentView.swift
//  newProject5
//
//  Created by Адам Дотмерзаев on 11.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var rectanglePosition = CGPoint(x: UIScreen.main.bounds.width / 2,
                                                   y: UIScreen.main.bounds.height / 2)
    private let backgroundColors = [Color.white, .pink, .yellow, .black]
    private let rectangleColors = [Color.black, .white, .black, .white]
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(rectangleColors, id: \.self) {
                    $0
                }
            }
            
            VStack(spacing: 0) {
                ForEach(backgroundColors, id: \.self) {
                    $0
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .blendMode(.destinationOut)
                    .frame(width: 100, height: 100)
                    .position(rectanglePosition)
            }
            .compositingGroup()
            .gesture(DragGesture()
                .onChanged {
                    rectanglePosition = $0.location
                })
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
