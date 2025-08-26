//
//  TaskRowView.swift
//  AppToDoList
//
//  Created by Leonardo Alves Viana on 26/08/25.
//

import Foundation
import SwiftUI

struct TaskRowView: View {
    // Usamos @Binding para que a view possa modificar a tarefa diretamente
        @Binding var task: Task
        
        // Estado para controlar se a view está em modo de edição
        @State private var isEditing = false
        
        // Opcional: para focar no TextField automaticamente
        @FocusState private var isTextFieldFocused: Bool
        
        var body: some View {
            HStack {
                // Botão para marcar como concluída
                Button {
                    task.isCompleted.toggle()
                } label: {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? .green : .gray)
                }
                
                // Alterna entre TextField e Text
                if isEditing {
                    TextField("Editar tarefa...", text: $task.title)
                        .focused($isTextFieldFocused)
                        .onSubmit {
                            isEditing = false
                        }
                } else {
                    Text(task.title)
                        .strikethrough(task.isCompleted, color: .gray)
                        .onTapGesture(count: 2) {
                            isEditing = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isTextFieldFocused = true
                            }
                        }
                }
            }
        }
}
