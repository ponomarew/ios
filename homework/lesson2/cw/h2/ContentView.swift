//
//  ContentView.swift
//  h2
//
//  Created by Tiiviu on 28/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [String] = []
    @State private var newTask: String = ""
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Todo Sasha")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                    .padding(.top)
                
                HStack(spacing: 12) {
                    TextField("Enter a new sasha...", text: $newTask)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.done)
                    
                    Button("Add Sasha") {
                        addTask()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(newTask.isEmpty)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Tasks (\(items.count))")
                        .font(.headline)
                        .foregroundColor(.pink)
                        .padding(.horizontal)
                    
                    if items.isEmpty {
                        VStack {
                            Image(systemName: "checklist")
                                .font(.system(size: 50))
                                .foregroundColor(.pink)
                            Text("No sasha yet!\nAdd your first sasha above.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.pink)
                                .padding()
                                .opacity(0.7)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 50)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 8) {
                                ForEach(items, id: \.self) { task in
                                    HStack {
                                        Image(systemName: "list.bullet.circle.fill")
                                            .foregroundColor(.blue)
                                            .font(.title3)
                                        
                                        Text(task)
                                            .font(.body)
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 1)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
    private func addTask() {
        guard !newTask.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        withAnimation(.easeInOut(duration: 0.3)) {
            items.append(newTask)
            newTask = ""
        }
    }
}

#Preview {
    ContentView()
}
