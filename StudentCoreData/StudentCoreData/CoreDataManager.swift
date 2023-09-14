//
//  CoreDataManager.swift
//  StudentCoreData
//
//  Created by Vanieka Sharma on 14/09/2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "StudentCoreDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    //fetching the data to display it in app
    func getStudents() -> [Student] {
        
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    //for saving or adding data in the database
    func saveStudent(name: String) {
        
        let student = Student(context: persistentContainer.viewContext)
        student.name = name
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save student \(error)")
        }
        
    }
    
    //deleting the student name from database
    func deleteStudent(name: Student) {
        
        persistentContainer.viewContext.delete(name)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
        
    }
    
    //Code for editing or updating the name of student
    func updateStudent() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    
    //deleting the whole entity from the database
    func deleteAllStudent(Student: String){
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}
