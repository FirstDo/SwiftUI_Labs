//
//  SceneDelegate.swift
//  CoordinatorEX
//
//  Created by LS-MAC-00213 on 2023/10/05.
//

import UIKit
import SwiftUI

import ComposableArchitecture

protocol Router: AnyObject {
  var stack: UINavigationController! { get set }
}

class ARouter: Router {
  unowned var stack: UINavigationController!
  
  init(stack: UINavigationController!) {
    self.stack = stack
  }
  
  init() {
    
  }
  
  func pushA() {
    stack?.pushViewController(AView(router: self).toVC, animated: true)
  }
  
  func modalA() {
    let nav = UINavigationController()
    let router = ARouter(stack: nav)
    let aView = AView(router: router).toVC
    nav.setViewControllers([aView], animated: true)
    stack.topViewController?.present(nav, animated: true)
  }
  
  func pop() {
    stack.popViewController(animated: true)
  }
  
  func popToRoot() {
    stack.popToRootViewController(animated: true)
  }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
  
    let navi = UINavigationController()
    
    let router = ARouter(stack: navi)
    let vc = AView(router: router).toVC
    
    navi.setViewControllers([vc], animated: true)
    
    window?.rootViewController = navi
    window?.makeKeyAndVisible()
  }

  func sceneDidDisconnect(_ scene: UIScene) { }

  func sceneDidBecomeActive(_ scene: UIScene) { }

  func sceneWillResignActive(_ scene: UIScene) { }

  func sceneWillEnterForeground(_ scene: UIScene) { }

  func sceneDidEnterBackground(_ scene: UIScene) { }
}

func showModal(top: UIViewController) -> UINavigationController {
  let vc1 = UIViewController()
  vc1.view.backgroundColor = .red
  
  let navi = UINavigationController(rootViewController: vc1)
  top.present(navi, animated: true)
  return navi
}
