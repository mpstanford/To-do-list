//
//  AppDelegate.swift
//  Get Shit Done
//
//  Created by Madison Stanford-Geromel on 5/4/18.
//  Copyright © 2018 Madison Stanford-Geromel. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        } catch {
            print("Error initializing Realm \(error)")
        }
        return true
    }




}

