import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize the window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Set the root view controller to SplashSceneView
        let contentView = SplashSceneView()
        window?.rootViewController = UIHostingController(rootView: contentView)
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Pause ongoing tasks, disable timers, etc.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Release shared resources, save user data, etc.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Undo changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused.
    }
}
