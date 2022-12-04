//
//  CMDataStack.swift
//  Marvel
//
//  Created by Cloy Vserv on 30/11/22.
//

import Foundation
import CoreData

final class CMDataStack {
    private let modelName: String
    private var managedObjectModel: NSManagedObjectModel?
    private var persistentStoreCoordinator: NSPersistentStoreCoordinator?
    var managedContext: NSManagedObjectContext?
    init(modelName: String) {
        self.modelName = modelName
        guard let modelUrl = Bundle(for: CMDataStack.self).url(forResource: self.modelName, withExtension: "momd") else {
            return
        }
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelUrl) else {
            return
        }
        self.managedObjectModel = managedObjectModel
        self.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        let fileManager = FileManager.default
        let storeName = "\(self.modelName).sqlite"
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
        let _ = try? persistentStoreCoordinator?.addPersistentStore(type: .sqlite, configuration: nil, at: persistentStoreURL, options: nil)
        self.managedContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        self.managedContext?.persistentStoreCoordinator = self.persistentStoreCoordinator
    }
    func saveContext() throws {
        guard let managedContext = managedContext,
              managedContext.hasChanges else {
            return
        }
        try managedContext.save()
    }
}
