//
//  MainTodoListView.swift
//  Todo
//
//  Created by YJ Soon 
//

import SwiftUI

struct MainTodoListView: View {
    
    @State var todos: [Todo] = []
    @State private var showConfirmAlert = false
    @State private var showAddSheet = false
    @State private var searchTerm = ""
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach($todos) { $todo in
                    TodoRowView(todo: $todo)
                }
                .onDelete(perform: deleteTodos)
                .onMove(perform: moveTodos)
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
#if DEBUG
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "list.bullet.clipboard.fill")
                    }
#endif
                    
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .sheet(isPresented: $showAddSheet) {
                NewTodoView(todos: $todos)
                    .presentationDetents([.medium])
            }
            .alert("Load sample data? Warning: This cannot be undone!", isPresented: $showConfirmAlert) {
                Button("Replace", role: .destructive, action: loadSampleData)
            }
            
        }
        
    }
    
    private func deleteTodos(at offsets: IndexSet) {
        for index in offsets {
            todos.remove(atOffsets: offsets)
        }
    }
    
    private func moveTodos(from source: IndexSet, to destination: Int) {
        todos.move(fromOffsets: source, toOffset: destination)
    }
    
    private func loadSampleData() {
        todos = Todo.sampleTodos
    }
    
}

#Preview {
    MainTodoListView()
}
