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
    
    func fetchTasks() {
        tasks = []
        completedTasks = []
        let fetchedTasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        for task in fetchedTasks {
            !task.isCompleted ? tasks.append(task) : completedTasks.append(task)
        }
    }
    
    static func createTask(title: String, isCompleted: Bool) {
        let id = UUID()
        let task = Task(id: id, title: title, isCompleted: isCompleted)
//        tasks.append(task)
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
