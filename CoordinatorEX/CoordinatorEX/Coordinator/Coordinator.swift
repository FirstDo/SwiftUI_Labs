import UIKit

// MARK: A

protocol Coordinator {
  var navigationController: UINavigationController { get set }
}

protocol ACoordinator: Coordinator {
  func pushToA()
}

extension ACoordinator {
  func pushToA() {
    let a = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AVC")
    navigationController.pushViewController(a, animated: true)
  }
}

class ACoordi: ACoordinator {
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  deinit {
    print("A Coordi")
  }
}

// MARK: B

protocol BCoordinator: Coordinator {
  func pushToB()
}

extension BCoordinator {
  func pushToB() {
    let b = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AVC")
    navigationController.pushViewController(b, animated: true)
  }
}

class BCoordi: BCoordinator {
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  deinit {
    print("B Coordi")
  }
}
