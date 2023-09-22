import UIKit
import FlexLayout
import PinLayout

var nav: UINavigationController!

class ViewController: UIViewController {
  
  override func loadView() {
    super.loadView()
    
    nav = navigationController
    view = MainView(frame: view.frame)
  }
}

fileprivate class MainView: UIView {
  let container = UIView()
  
  let btn1 = UIButton()
  let btn2 = UIButton()
  let btn3 = UIButton()
  let btn4 = UIButton()
  let btn5 = UIButton()
  let btn6 = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    
    [btn1, btn2, btn3, btn4, btn5, btn6].enumerated().forEach {
      $0.1.setTitle("\($0.0) example", for: .normal)
      $0.1.configuration = .borderedProminent()
    }
    
    btn1.addAction {
      nav.pushViewController(Example1VC(), animated: true)
    }
    
    btn2.addAction {
      nav.pushViewController(Example2VC(), animated: true)
    }
    
//    btn3.addAction {
//      nav.pushViewController(Example3VC(), animated: true)
//    }
//
//    btn4.addAction {
//      nav.pushViewController(Example4VC(), animated: true)
//    }
//
//    btn5.addAction {
//      nav.pushViewController(Example5VC(), animated: true)
//    }
//
//    btn6.addAction {
//      nav.pushViewController(Example6VC(), animated: true)
//    }
    
    addSubview(container)
    
    container.flex.direction(.column).padding(12).define { flex in
      flex.addItem(btn1)
      flex.addItem(btn2)
      flex.addItem(btn3)
      flex.addItem(btn4)
      flex.addItem(btn5)
      flex.addItem(btn6)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    container.pin.top().horizontally().margin(pin.safeArea)
    container.flex.layout(mode: .adjustHeight)
  }
}
