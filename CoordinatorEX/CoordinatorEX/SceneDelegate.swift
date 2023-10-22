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
  var navi: UINavigationController? { get set }
}

class RouterImpl: Router {
  weak var navi: UINavigationController?
  
  init(navi: UINavigationController?) {
    self.navi = navi
  }
  
  func pushA() {
    navi?.pushViewController(AView(router: self).toVC, animated: true)
  }
  
  func modalA() {
    let nav = UINavigationController()
    let router = RouterImpl(navi: nav)
    let aView = AView(router: router).toVC
    nav.setViewControllers([aView], animated: true)
    navi?.topViewController?.present(nav, animated: true)
  }
  
  func pop() {
    navi?.popViewController(animated: true)
  }
  
  func popToRoot() {
    navi?.popToRootViewController(animated: true)
  }
  
  deinit {
    print(#function)
  }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
  
    let navi = UINavigationController()
    
    let router = RouterImpl(navi: navi)
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
