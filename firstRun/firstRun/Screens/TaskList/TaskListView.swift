//
//  TaskListView.swift
//  firstRun
//
//  Created by James Lea on 5/19/23.
//

import SwiftUI

struct TaskListView: View {
    let viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(mockTasks) { task in
                    let title = task.title ?? ""
                    Text("\(title)")
                        .swipeActions(edge: .trailing) {
                            Button {
                                print("done tapped")
                            } label: {
                                Text("Done")
                            }
                            .tint(.green)
                            
                            Button(action: {
                                deleteTask(task: task)
                            }) {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            
            
        }
    }
    
    func deleteTask(task: Task) {
        if let index = viewModel.tasks.firstIndex(of: task) {
            viewModel.tasks.remove(at: index)
        }
    }
    
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
