import UIKit
import SwiftUI

import FlexLayout
import PinLayout

class ViewController: UIViewController {
  
  override func loadView() {
    super.loadView()
    
    self.view = HeartRateView(frame: view.frame)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "심장"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}
