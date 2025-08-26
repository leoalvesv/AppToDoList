//
//  ContentView.swift
//  AppToDoList
//
//  Created by Leonardo Alves Viana on 26/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
       @State private var newTaskTitle: String = ""
       
       var body: some View {
           NavigationView {
               VStack {
                   HStack {
                       TextField("Nova tarefa...", text: $newTaskTitle)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                       
                       Button {
                           guard !newTaskTitle.isEmpty else { return }
                           viewModel.addTask(title: newTaskTitle)
                           newTaskTitle = ""
                       } label: {
                           Image(systemName: "plus.circle.fill")
                               .font(.title)
                       }
                   }
                   .padding()
                   
                   List {
                       ForEach($viewModel.tasks) { $task in
                           TaskRowView(task: $task)
                               .swipeActions {
                                   Button(role: .destructive) {
                                       viewModel.deleteTask(at: IndexSet(integer: viewModel.tasks.firstIndex(where: { $0.id == task.id })!))
                                   } label: {
                                       Label("Apagar", systemImage: "trash")
                                   }
                               }
                       }
                   }
               }
               .navigationTitle("Minhas Tarefas")
           }
       }
}

#Preview {
    ContentView()
}
