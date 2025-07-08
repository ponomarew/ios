//
//  ContentView.swift
//  learning
//
//  Created by Alexander Ponomarev on 8/7/25.
//

// добавить удаление задач по свайпу
// сделать красивый дизайн

import SwiftUI

struct ContentView: View {
        
    @StateObject private var taskManager = TaskManager()
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        VStack {
            TextField("New task", text: $newTaskTitle)
                .padding(.horizontal, 16)
            Button("Add task", action: addTask)
        }
        List {
            ForEach(taskManager.tasks) { task in
                HStack {
                    Text(task.title)
                        .foregroundStyle(!task.isCompleted ? .red : .green)
                    Spacer()
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                }
                .onTapGesture {
                    taskManager.toggleCompletion(of: task)
                }
            }
        }
    }
    
    @MainActor
    func addTask() {
        taskManager.addTask(task: Task(title: newTaskTitle, isCompleted: false))
        newTaskTitle = ""
    }
}

#Preview {
    ContentView()
}
