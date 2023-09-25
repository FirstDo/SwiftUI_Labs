import UIKit

import FlexLayout
import PinLayout

class ViewController: UIViewController {
  
  override func loadView() {
    super.loadView()
    
    self.view = MainView(frame: view.frame)
  }
}

fileprivate class MainView: UIView {
  let container = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    container.pin.all(pin.safeArea)
    container.flex.layout()
  }
}
