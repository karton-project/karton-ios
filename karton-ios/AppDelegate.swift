//
//  AppDelegate.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 18.06.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }




}

