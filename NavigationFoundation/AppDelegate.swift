//
//  AppDelegate.swift
//  NavigationFoundation
//
//  Created by Milos on 12/20/18.
//  Copyright © 2018 Milos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainNavigationController = UINavigationController()
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            let vcRed = UIViewController()
            vcRed.title = "1"
            vcRed.view.backgroundColor = .red
            mainNavigationController.show(vcRed, sender: self)
        }

        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (_) in
            let vcYellow = UIViewController()
            vcYellow.title = "2"
            vcYellow.view.backgroundColor = .yellow
            mainNavigationController.show(vcYellow, sender: self)
        }
        
        Timer.scheduledTimer(withTimeInterval: 6, repeats: false) { (_) in
            let vcGreen = UIViewController()
            vcGreen.title = "3"
            vcGreen.view.backgroundColor = .green
            mainNavigationController.present(vcGreen, animated: true)
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                let vcBlue = UIViewController()
                vcBlue.title = "4"
                vcBlue.view.backgroundColor = .blue
                vcGreen.present(vcBlue, animated: true)
                
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                    print(mainNavigationController.viewControllers)
                    vcGreen.dismiss(animated: true)
                }
            }
        }
        
        return true
    }


}

