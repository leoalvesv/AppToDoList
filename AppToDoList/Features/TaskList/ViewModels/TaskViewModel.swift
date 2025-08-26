//
//  TaskViewModel.swift
//  AppToDoList
//
//  Created by Leonardo Alves Viana on 26/08/25.
//

import Foundation

class TaskViewModel: ObservableObject {
        @Published var tasks: [Task] = []
        
        private let tasksKey = "tasksKey" // Chave para UserDefaults
        
        init() {
            loadTasks()
        }
        
        private func saveTasks() {
            if let encodedData = try? JSONEncoder().encode(tasks) {
                UserDefaults.standard.set(encodedData, forKey: tasksKey)
            }
        }
        
        private func loadTasks() {
            if let savedData = UserDefaults.standard.data(forKey: tasksKey) {
                if let decodedTasks = try? JSONDecoder().decode([Task].self, from: savedData) {
                    tasks = decodedTasks
                    return
                }
            }
            tasks = []
        }
        
        func addTask(title: String) {
            let newTask = Task(title: title)
            tasks.append(newTask)
            saveTasks()
        }
        
        func deleteTask(at offsets: IndexSet) {
            tasks.remove(atOffsets: offsets)
            saveTasks()
        }
        
        func toggleTaskCompletion(for task: Task) {
            if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                tasks[index].isCompleted.toggle()
                saveTasks()
            }
        }
        
        func updateTaskTitle(for task: Task, newTitle: String) {
            if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                tasks[index].title = newTitle
                saveTasks()
            }
        }
    }

