//
//  AppDelegate.swift
//  InterviewSolar
//
//  Created by Titi3012 on 19/03/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func prime_divisor(n: Int){
        var n = n
        if Int(sqrt(Double(n))) > 2 {
            for i in 2 ... Int(sqrt(Double(n))) {
                if(n % i == 0){
                    print("\(i)");
                    while n % i == 0 {
                        n = n / i;
                    }
                }
            }
        }
       if n > 1{
        print("\n : \(n)")
       }
    }
    
    func factorial(_ n: Int) -> Int {
        var result = 2
        for i in 4 ... n {
            if i%2 == 0 {
                result *= i
            }
        }
        return result
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

