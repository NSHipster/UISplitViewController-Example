import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var splitViewDelegate = SplitViewDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let splitViewController = self.window?.rootViewController as? UISplitViewController,
            let navigationController = splitViewController.viewControllers.last as? UINavigationController
        {
            splitViewController.delegate = splitViewDelegate
            
            navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            navigationController.topViewController?.navigationItem.leftItemsSupplementBackButton = true
        }
        
        return true
    }
}

