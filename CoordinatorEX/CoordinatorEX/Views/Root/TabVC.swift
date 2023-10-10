import UIKit

class MainRouter: Router {
  let navigationController: UINavigationController
  unowned let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
    self.navigationController = UINavigationController()
    navigationController.navigationBar.isHidden = true
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
  
  func start() {
    let tabVC = TabVC()
    
    let aRouter = ARouter(navigationController: UINavigationController())
    aRouter.start()
    
    let bRouter = BRouter(navigationController: UINavigationController())
    bRouter.start()
    
    tabVC.setViewControllers([aRouter.navigationController, bRouter.navigationController], animated: true)
    
    if let items = tabVC.tabBar.items {
      items[0].image = UIImage(systemName: "apple.logo")
      items[0].title = "A"
  
      items[1].image = UIImage(systemName: "apple.logo")
      items[1].title = "B"
    }
    
    navigationController.pushViewController(tabVC, animated: false)
  }
}

class TabVC: UITabBarController {
  
  weak var router: MainRouter?
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .red
  }
}
