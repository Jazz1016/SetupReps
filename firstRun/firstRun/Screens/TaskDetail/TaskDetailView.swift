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
    var task: Task?
    
    init(isShowingDetail: Binding<Bool>, task: Task? = nil) {
        self.task = task
        _isShowingDetail = isShowingDetail
        _textField = State(initialValue: task?.title ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                     isShowingDetail = false
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button {
                    isShowingDetail = false
                    // save changes to task or save new task (WILL NEED ANOTHER BOOL?)
                } label: {
                    Text("Save")
                        .foregroundColor(.blue)
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
