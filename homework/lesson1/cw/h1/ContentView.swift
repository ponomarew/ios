//
//  ContentView.swift
//  h1
//
//  Created by Tiiviu on 27/11/25.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Sasha: \(count)")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
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
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 80, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    count = 0
                }) {
                    Text("Reset")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 80, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    count += 1
                }) {
                    Text("+1")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 80, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
    
    func mood() -> String {
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

#Preview {
    ContentView()
}
