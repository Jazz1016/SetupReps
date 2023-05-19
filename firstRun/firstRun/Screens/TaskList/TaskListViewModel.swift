//
//  TaskListViewModel.swift
//  firstRun
//
//  Created by James Lea on 5/19/23.
//

import Foundation
import CoreData

final class TaskListViewModel: ObservableObject {
    var selectedTask: Task? {
        didSet {
            isShowDetailView = true
        }
    }
    @Published var tasks: [Task] = []
    @Published var completedTasks: [Task] = []
    @Published var isShowDetailView: Bool = false
    
    lazy var fetchRequest: NSFetchRequest<Task> = {
         let request = NSFetchRequest<Task>(entityName: "Task")
         request.predicate = NSPredicate(value: true)
         return request
        }()
    
    func fetchTasks() -> [Task] {
        return (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
    }
    
    func createTask(title: String, isCompleted: Bool) {
        let id = UUID()
        Task(id: id, title: title, isCompleted: isCompleted)
        CoreDataStack.saveContext()
    }
    
    func updateTask(task: Task, title: String, isCompleted: Bool){
        task.title = title
        task.isCompleted = isCompleted
        CoreDataStack.saveContext()
    }
    
    func deleteTask(task: Task) {
        CoreDataStack.context.delete(task)
        CoreDataStack.saveContext()
    }
}
