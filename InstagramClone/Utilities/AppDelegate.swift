//
//  AppDelegate.swift
//  InstagramClone
//
//  Created by mac on 01/04/23.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        if UserDefaults.standard.bool(forKey: "register"){
            main()
        }
        else{
            register()
        }
        window?.makeKeyAndVisible()
        return true
    }
    func register(){
        let vc = RegsterViewController()
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }
    func main(){
        let vc = TabBarViewController()
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }
}
