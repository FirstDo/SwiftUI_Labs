//
//  SceneDelegate.swift
//  CoordinatorEX
//
//  Created by LS-MAC-00213 on 2023/10/05.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
  
    let vc1 = UIViewController()
    vc1.view.backgroundColor = .red
  
    window?.rootViewController = UINavigationController(rootViewController: vc1)
    window?.makeKeyAndVisible()
        
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      let navi = showModal(top: vc1)
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        let navi = showModal(top: navi.topViewController!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          let navi = showModal(top: navi.topViewController!)
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let navi = showModal(top: navi.topViewController!)
          }
        }
      }
    }
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
