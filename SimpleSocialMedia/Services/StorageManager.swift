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
            postEntity.isFavorite = post.isFavorite ?? false 
        }
        saveContext()
    }
    
    func fetchPosts(completion: (Result<[Post], Error>) -> Void) {
        let request = PostEntity.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            let postEntity = try viewContext.fetch(request)
            let posts = postEntity.map { post in
                Post(
                    userId: Int(post.userId),
                    id: Int(post.id),
                    title: post.title ?? "",
                    body: post.body ?? "",
                    isFavorite: post.isFavorite
                )
            
            }
            completion(.success(posts))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    //MARK: - Favorite Button
    func getFavoriteStatus(for post: Post) -> Bool {
        let request = PostEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", post.id)
        
        do {
            let results = try viewContext.fetch(request)
            guard let postEntity = results.first else { return false }
            let favoriteStatus = postEntity.isFavorite
            return favoriteStatus
        } catch let error {
            print("Error fetching like status: \(error)")
            return false
        }
    }
    
    func setFavoriteStatus(for post: Post, with status: Bool) {
        let request = PostEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", post.id)
        
        do {
            let results = try viewContext.fetch(request)
            guard let postEntity = results.first else { return }
            postEntity.isFavorite = status
            saveContext()
        } catch let error {
            print("Error change like status: \(error)")
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
