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
        case minusOne
        case zero
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case none
    }
    
    var window: UIWindow?
    var selectedFlow = Flow.thruStoryboard
    var scenario = Scenario.eight
    
    let mainNavigationController = UINavigationController()
    let vcRed = UIViewController()
    let vcYellow = UIViewController()
    let vcGreen = UIViewController()
    let vcBlue = UIViewController()
    let vcBrown = UIViewController()
    
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
        
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
        
        vcRed.title = "1"
        vcRed.view.backgroundColor = .red
        
        
        vcYellow.title = "2"
        vcYellow.view.backgroundColor = .yellow
        
        
        vcGreen.title = "3"
        vcGreen.view.backgroundColor = .green
        
        
        vcBlue.title = "4"
        vcBlue.view.backgroundColor = .blue
        
        
        vcBrown.title = "4"
        vcBrown.view.backgroundColor = .brown
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            // show vcRed from mainNavigationController
            self.mainNavigationController.show(self.vcRed, sender: self)
        }
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (_) in
            // show vcYellow from mainNavigationController
            self.mainNavigationController.show(self.vcYellow, sender: self)
        }
        
        Timer.scheduledTimer(withTimeInterval: 6, repeats: false) { (_) in
            // present vcGreen from mainNavigationController
            self.mainNavigationController.present(self.vcGreen, animated: true)
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                // present vcBlue from vcGreen
                self.vcGreen.present(self.vcBlue, animated: true)
                
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                    // present vcBrown from vcBlue
                    self.vcBlue.present(self.vcBrown, animated: true, completion: nil)
                    self.startScenarios()
                }
            }
        }
    }
    
    func startScenarios() {
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            
            switch self.scenario {
            case .minusOne:
                // calling dismiss on vcBrown will dismiss only vcBrown
                self.vcBrown.dismiss(animated: true, completion: nil)
            case .zero:
                // calling dismiss on vcBlue, when vcBrown is presented from vcBlue, will dismiss only vcBrown
                self.vcBlue.dismiss(animated: true, completion: nil)
            case .one:
                // calling dismiss on vcBlue will dismiss only vcBlue if it is not presenting vcBrown
                
                // first: dismiss vcBrown
                self.vcBrown.dismiss(animated: false, completion: nil)
                // second: call dismiss on vcBlue
                self.vcBlue.dismiss(animated: true, completion: nil)
            case .two:
                // calling dismiss on vcGreen while presenting vcBlue whitch is presenting vcBrown will dismiss not only vcBlue, but vcBrown as well
                self.vcGreen.dismiss(animated: true, completion: nil)
            case .three:
                // calling dismiss on vcBlue twice, while vcBlue is presenting vcBrown and vcBlue being presented from vcGreen, will first dismiss vcBrown and then dismiss VcBlue
                self.vcBlue.dismiss(animated: true, completion: nil)
                self.vcBlue.dismiss(animated: true, completion: nil)
            case .four:
                // calling dismiss on vcGreen twice, while presenting vcBlue who is presenting vcBrown, will first dismiss vcBlue together with vcBrown, and then dismiss vcGreen
                self.vcGreen.dismiss(animated: true, completion: nil)
                self.vcGreen.dismiss(animated: true, completion: nil)
            case .five:
                // calling dismiss from shown/pushed vcYellow will dismiss everything presented above itself, in this case: vcGreen, vcBlue and vcBrown
                self.vcYellow.dismiss(animated: true, completion: nil)
            case .six:
                // "catching" vcYellow with ".presentingViewController?" will dismiss everything above, in this case: vcGreen, vcBlue and vcBrown
                self.vcBrown.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
            case .seven:
                // calling dismiss on mainNavigationController will dismiss all presented view controllers
                self.mainNavigationController.dismiss(animated: true, completion: nil)
            case .eight:
                // popViewController needs to be called when all presented viewControllers have been dismissed
                self.mainNavigationController.dismiss(animated: false, completion: nil)
                self.vcYellow.navigationController?.popViewController(animated: true)
            case .none:
                break
            }
        }
    }
}
