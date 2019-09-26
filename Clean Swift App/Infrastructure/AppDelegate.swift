//
//  AppDelegate.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        prepareRootViewController()
        return true
    }

}


private extension AppDelegate {
    func prepareRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: LandingViewController(router: LandingRouter(), interactor: LandingInteractor()))
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.titleTextAttributes = [
            .foregroundColor:  UIColor.black.withAlphaComponent(0.7)
        ]
        window?.rootViewController = navigationController
    }
}
