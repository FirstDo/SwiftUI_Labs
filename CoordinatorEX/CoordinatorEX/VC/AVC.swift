//
//  AVC.swift
//  CoordinatorEX
//
//  Created by LS-MAC-00213 on 2023/10/05.
//

import UIKit

class AVC: UIViewController {
  var a: ACoordinator?
  var b: BCoordinator?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    a = ACoordi(navigationController: self.navigationController!)
    b = BCoordi(navigationController: self.navigationController!)
    
  }
  
  @IBAction func ATap(_ sender: Any) {
    a?.pushToA()
  }
  
  @IBAction func BTap(_ sender: Any) {
    b?.pushToB()
  }
  
  deinit {
    print("A")
  }
}
