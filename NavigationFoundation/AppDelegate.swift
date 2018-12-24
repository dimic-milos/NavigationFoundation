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

    enum Flow {
        case thruStoryboard
        case thruCode
    }
    
    enum Scenario {
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
    }
    
    var window: UIWindow?
    var selectedFlow = Flow.thruCode
    var scenario = Scenario.six

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        switch selectedFlow {
            
        case .thruStoryboard:
            break
        case .thruCode:
            startCodeFlow()
        }
        
        return true
    }

    func startCodeFlow() {
        let mainNavigationController = UINavigationController()
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
        
        let vcRed = UIViewController()
        vcRed.title = "1"
        vcRed.view.backgroundColor = .red
        
        let vcYellow = UIViewController()
        vcYellow.title = "2"
        vcYellow.view.backgroundColor = .yellow
        
        let vcGreen = UIViewController()
        vcGreen.title = "3"
        vcGreen.view.backgroundColor = .green
        
        let vcBlue = UIViewController()
        vcBlue.title = "4"
        vcBlue.view.backgroundColor = .blue
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            // show vcRed from mainNavigationController
            mainNavigationController.show(vcRed, sender: self)
        }
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (_) in
            // show vcYellow from mainNavigationController
            mainNavigationController.show(vcYellow, sender: self)
        }
        
        Timer.scheduledTimer(withTimeInterval: 6, repeats: false) { (_) in
            // present vcGreen from mainNavigationController
            mainNavigationController.present(vcGreen, animated: true)
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                // present vcBlue from vcGreen
                vcGreen.present(vcBlue, animated: true)
                
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                    
                    switch self.scenario {
                        
                    case .one:
                        // calling dismiss on vcBlue will dismiss only vcBlue
                        vcBlue.dismiss(animated: false, completion: nil)
                    case .two:
                        // calling dismiss on vcGreen will dismiss only vcBlue
                        vcGreen.dismiss(animated: false, completion: nil)
                    case .three:
                        // calling dismiss on vcBlue twice will only dismiss vcBlue
                        vcBlue.dismiss(animated: true, completion: nil)
                        vcBlue.dismiss(animated: true, completion: nil)
                    case .four:
                        // calling dismiss on vcGreen twice will first dismiss vcBlue and then dismiss vcGreen
                        vcGreen.dismiss(animated: false, completion: nil)
                        vcGreen.dismiss(animated: false, completion: nil)
                    case .five:
                        // will dismiss everything above, in this case vcGreen and vcBlue
                        vcYellow.dismiss(animated: true, completion: nil)
                    case .six:
                        // will dismiss everything above, in this case vcGreen and vcBlue
                        vcBlue.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                    case .seven:
                        // calling dismiss on mainNavigationController will dismiss all presented view controllers
                        mainNavigationController.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
