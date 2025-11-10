import SwiftUI
import SwiftData

struct NewTodoView: View {
    
    @State private var todoTitle = ""
    @State private var todoSubtitle = ""
    @Environment(\.dismiss) var dismiss
    @Binding var todos: [Todo]

    var body: some View {
        Form {
            Section("Info") {
                TextField("Title", text: $todoTitle)
                TextField("Subtitle", text: $todoSubtitle)
            }
            
            Section("Actions") {
                Button("Save") {
                    let todo = Todo(title: todoTitle, subtitle: todoSubtitle)
                    todos.append(todo)
                    dismiss()
                }
                .disabled(todoTitle.isEmpty) // prevent saving if no title

                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var todos: [Todo] = []
    NewTodoView(todos: $todos)
}
