//
//  DataManager.swift
//  WeatherTest
//
//  Created by User on 26/05/23.
//

import Foundation
import CoreData

//@objc(CacheData)
//public class CacheData: NSManagedObject {
//
//}

//extension CacheData {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<CacheData> {
//        return NSFetchRequest<CacheData>(entityName: "CacheData")
//    }
//
//    @NSManaged public var key: String?
//    @NSManaged public var data: Data?
//}
//
//// MARK: Generated accessors for songs
//extension CacheData {
//
//    @objc(addToCacheData:)
//    @NSManaged public func addToCacheData(_ value: CacheData)
//
//    @objc(removeFromCacheData:)
//    @NSManaged public func removeFromCacheData(_ value: CacheData)
//
//}
//
//extension CacheData : Identifiable {
//
//}



class DataManager {
  static let shared = DataManager()
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "WeatherTest2")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  //Core Data Saving support
  func save () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
          try context.save()
      } catch {
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
    
    func setCacheData(key: String, data: Data) -> CacheData {
      let cacheData = CacheData(context: persistentContainer.viewContext)
        cacheData.key = key
        cacheData.data = data
      return cacheData
    }
    
    func getCacheData(key: String) -> [CacheData] {
        let request: NSFetchRequest<CacheData> = CacheData.fetchRequest()
        request.predicate = NSPredicate(format: "key = %@", key)
        var fetchedCache: [CacheData] = []
        
        do {
            fetchedCache = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching cache \(error)")
        }
        return fetchedCache
    }
    
    func saveCacheData(key: String, data: Data) {
        let request: NSFetchRequest<CacheData> = CacheData.fetchRequest()
        request.predicate = NSPredicate(format: "key = %@", key)
        var fetchedCache: [CacheData] = []
        
        do {
            fetchedCache = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching cache \(error)")
        }
        if fetchedCache.isEmpty {
            fetchedCache.append(setCacheData(key: key, data: data))
        } else {
            fetchedCache.first?.data = data
        }
        save()
    }
}
