//
//  StorageManager.swift
//  SimpleSocialMedia
//
//  Created by Дарина Самохина on 21.11.2025.
//

import CoreData

class StorageManager {
    static let shared = StorageManager()
    
    // MARK: - Core Data stack
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SimpleSocialMedia")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
    
    private init() {
        viewContext = persistentContainer.viewContext
    }
    
    //MARK: - CRUD
    func save(_ posts: [Post]) {
        deleteAllPosts()
        for post in posts {
            let postEntity = PostEntity(context: viewContext)
            postEntity.userId = Int64(post.userId)
            postEntity.id = Int64(post.id)
            postEntity.title = post.title
            postEntity.body = post.body
        }
        saveContext()
    }
    
    func fetchPosts(completion: (Result<[Post], Error>) -> Void) {
        let request = PostEntity.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            let postEntity = try viewContext.fetch(request)
            var posts: [Post] = []
            for post in postEntity {
                posts.append(
                    Post(
                        userId: Int(post.userId),
                        id: Int(post.id),
                        title: post.title ?? "",
                        body: post.body ?? ""
                    )
                )
            }
            completion(.success(posts))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

//MARK: - Private Methods
extension StorageManager {
    private func deleteAllPosts() {
        let request = PostEntity.fetchRequest()
        
        do {
            let posts = try viewContext.fetch(request)
            posts.forEach { viewContext.delete($0) }
            saveContext()
        } catch {
            print("Error deleting posts: \(error)")
        }
    }
}
