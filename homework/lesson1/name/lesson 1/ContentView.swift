//
//  ContentView.swift
//  lesson 1
//
//  Created by Alexander Ponomarev on 25/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(count)")
            
            HStack {
                Button("Increase") {
                    count += 1
                }
                
                Button("Decrease") {
                    count -= 1
                }
            }
            
            Text(mood())
                .foregroundStyle(color())
        }
        .padding()
    }
    
    func mood() -> String {
        if count < 0 {
            return "Negative"
        }
        if count > 0 {
            return "Positive"
        }
        return "Neutral"
    }
    
    func color() -> Color {
        if count > 0 {
            return .green
        }
        if count < 0 {
            return .red
        }
        return .gray
    }
}

#Preview {
    ContentView()
}
