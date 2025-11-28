//
//  ContentView.swift
//  h1
//
//  Created by Tiiviu on 27/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Sasha: \(count)")
                .font(.title)
                .fontWeight(.bold)
            
            Text(mood())
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(moodColor())
                .padding()
            
            HStack(spacing: 20) {
                Button(action: {
                    count -= 1
                }) {
                    Text("-1")
                        .buttonStyle(bgColor: .red)
                }
                
                Button(action: {
                    count = 0
                }) {
                    Text("Reset")
                        .buttonStyle(bgColor: .blue)
                }
                
                Button(action: {
                    count += 1
                }) {
                    Text("+1")
                        .buttonStyle(bgColor: .green)
                }
            }
        }
        .padding()
    }
    
    private func mood() -> String {
        if count < 0 {
            return "Negative"
        } else if count == 0 {
            return "Neutral"
        } else {
            return "Positive"
        }
    }
    
    private func moodColor() -> Color {
        if count < 0 {
            return .red
        } else if count == 0 {
            return .gray
        } else {
            return .green
        }
    }
}

struct ButtonTextModifier: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 80, height: 50)
            .background(bgColor)
            .cornerRadius(10)
    }
}

extension View {
    func buttonStyle(bgColor: Color) -> some View {
        modifier(ButtonTextModifier(bgColor: bgColor))
    }
}

#Preview {
    ContentView()
}
