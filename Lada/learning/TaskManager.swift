//
//  TaskManager.swift
//  learning
//
//  Created by Alexander Ponomarev on 8/7/25.
//

import Combine
import Foundation

class TaskManager: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    private let key = "tasks"
    
    init() {
        loadTasks()
    }
    
    func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                tasks = try JSONDecoder().decode([Task].self, from: data)
            } catch {
                print("Error loading tasks: \(error)")
            }
        }
    }
    
    func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
    
    func addTask(task: Task) {
        tasks.append(task)
        saveTasks()
    }
    
    func deleteTask(index: Int) {
        tasks.remove(at: index)
        saveTasks()
    }
    
    
    func toggleCompletion(of task: Task) {
        if let intIndex = tasks.firstIndex(of: task) {
            tasks[intIndex].isCompleted.toggle()
            saveTasks()
        }
    }
}
