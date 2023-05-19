//
//  TaskDetail.swift
//  firstRun
//
//  Created by James Lea on 5/19/23.
//

import SwiftUI

struct TaskDetailView: View {
    
    @State var textField: String = ""
    var task: Task? {
        didSet {
            textField = task?.title ?? ""
        }
    }
    
    var body: some View {
        TextField("Task", text: $textField)
        Button {
            
        } label: {
            Text("Delete")
        }
        .tint(.red)
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView()
    }
}
