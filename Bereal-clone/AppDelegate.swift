//
//  AppDelegate.swift
//  Bereal-clone
//
//  Created by Semen Kolesnykov on 2/16/25.
//

import UIKit
import ParseSwift


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ParseSwift.initialize(applicationId: "SUPVwdC5CCPljStALNVE5HgGkG8zOs4OEDRIW2PT",
                              clientKey: "wU3r9cIfdV6t3FKa3mGNNFiQ2nZ4lWuYbHkC7JvC",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)
        return true
    }

    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
       
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }


}

