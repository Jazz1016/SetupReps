//
//  TaskListView.swift
//  firstRun
//
//  Created by James Lea on 5/19/23.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("To Do")) {
                        ForEach(mockTasks) { task in
                            let title = task.title ?? ""
                            Text("\(title)")
                                .onTapGesture {
                                    viewModel.selectedTask = task
                                }
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
                    
                    Section(header: Text("Completed")) {
                        ForEach(viewModel.completedTasks) { task in
                            let title = task.title ?? "Erm... What the Spruce?"
                            Text("\(title)")
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.isShowDetailView = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
                //End of List
                
                }
            .navigationTitle(Text("Test"))
            .sheet(isPresented: $viewModel.isShowDetailView) {
                TaskDetailView(isShowingDetail: $viewModel.isShowDetailView, task: viewModel.selectedTask)
            }
            }
        }
    //End of View
    
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
