//
//  AppDelegate.swift
//  Get Shit Done
//
//  Created by Madison Stanford-Geromel on 5/4/18.
//  Copyright © 2018 Madison Stanford-Geromel. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }


    func applicationWillTerminate(_ application: UIApplication) {
  
        self.saveContext()
    }
    
    //IMPORTANT TO INCLUDE THE CORE-DATA VERSION OF APPLICATIONWILLTERMINATE, NOT THE ORIGINAL VERSION. THAT SELF.SAVECONTEXT() PART IS IMPT.
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = { //lazy means the var only gets loaded up when you try to use it. think: lazy person waking up at the last possible minute. memory benefit--so you only occupy memory space when it's really needed.
        
        let container = NSPersistentContainer(name: "DataModel") //nspersistentcontainer can use diff database languages, but usually sqlite
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
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



}

