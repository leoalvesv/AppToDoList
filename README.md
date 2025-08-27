# 📋 App To Do List

Um aplicativo simples de lista de tarefas desenvolvido em **SwiftUI**, com suporte a **edição, exclusão, marcação de concluído** e **persistência de dados** usando `UserDefaults`.

---

## 🚀 Funcionalidades

- ➕ **Adicionar tarefa**
- ✏️ **Editar título da tarefa** (com duplo clique)
- ✅ **Marcar tarefa como concluída**
- 🗑 **Excluir tarefa com swipe**
- 💾 **Salvamento automático** das tarefas no `UserDefaults`

---

## 🛠 Estrutura do Projeto

- `ContentView.swift` → Tela principal com lista de tarefas e botão de adicionar.  
- `TaskRowView.swift` → Componente para exibir e editar uma tarefa individual.  
- `TaskViewModel.swift` → ViewModel responsável por gerenciar tarefas e salvar no `UserDefaults`.  
- `Task.swift` → Modelo de dados de uma tarefa (`Identifiable`, `Codable`).  

---

## 📦 Requisitos

- Xcode 15+  
- iOS 17+  
- Swift 5.9+  
