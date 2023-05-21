//
//  TaskDetail.swift
//  firstRun
//
//  Created by James Lea on 5/19/23.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Binding var isShowingDetail: Bool
    @State var textField: String = ""
    @State var task: Task?
    
    init(isShowingDetail: Binding<Bool>, task: Task? = nil, viewModel: Binding<TaskListViewModel>) {
        self.task = task
        _viewModel = viewModel
        _isShowingDetail = isShowingDetail
        _textField = State(initialValue: task?.title ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.isShowingDetail = false
                    self.textField = ""
                    self.task = nil
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button {
                    isShowingDetail = false
                    if task != nil {
                        
                    }
                } label: {
                    Text("Save")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            Text("Task:")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextEditor(text: $textField)
                .font(.body)
                .foregroundColor(.black)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.7)
                )
                .frame(height: 150)
            Spacer()
            
        }
        .padding()
    }
}
