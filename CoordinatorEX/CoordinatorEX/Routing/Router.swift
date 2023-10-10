import Foundation
import UIKit
import SwiftUI

protocol Router: AnyObject {
  var navigationController: UINavigationController { get }
}

extension Router {
  func pop(animated: Bool = true) {
    navigationController.popViewController(animated: animated)
  }
  
  func popToRoot(animated: Bool = true) {
    navigationController.popToRootViewController(animated: animated)
  }
}
