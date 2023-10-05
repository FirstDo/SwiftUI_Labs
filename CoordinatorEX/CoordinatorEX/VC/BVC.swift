//
//  BVC.swift
//  CoordinatorEX
//
//  Created by LS-MAC-00213 on 2023/10/05.
//

import UIKit
import SwiftUI

class BVC: UIViewController {
  var a: ACoordinator?
  var b: BCoordinator?
  var c: (ACoordinator & BCoordinator)?
  
  let contentView = UIHostingController(rootView: BView())

  override func viewDidLoad() {
    super.viewDidLoad()
    
    a = ACoordi(navigationController: self.navigationController!)
    b = BCoordi(navigationController: self.navigationController!)
    addChild(contentView)
    view.addSubview(contentView.view)
  }
  
  @IBAction func ATap(_ sender: Any) {
    a?.pushToA()
  }
  
  @IBAction func BTap(_ sender: Any) {
    b?.pushToB()
  }
  
  deinit {
    print("B")
  }
}
