import UIKit
import SwiftUI

import FlexLayout
import PinLayout

class ViewController: UIViewController {
  
  var mainView: MainView {
    view as! MainView
  }
  
  override func loadView() {
    super.loadView()
    
    self.view = MainView(frame: view.frame)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "심장"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}

final class MainView: UIView {
  
  let scrollView = UIScrollView()
  let contentView = UIView()
  
  let topView = HeartRateView(frame: .zero)
  let bottomView = MoreView(frame: .zero)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .white
    scrollView.backgroundColor = .systemGray6
    addSubview(scrollView)
    scrollView.addSubview(contentView)
    
    contentView.flex.backgroundColor(.systemGray6).define {
      $0.addItem(topView)
      $0.addItem(bottomView).margin(20)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()

    topView.flex.height(1750)
    
    scrollView.pin.all()
    contentView.pin.top().horizontally()
    contentView.flex.layout(mode: .adjustHeight)
    scrollView.contentSize = contentView.frame.size
  }
}


struct MainView_Preview: PreviewProvider {
  static var previews: some View {
    UIViewPreview {
      MainView()
    }
  }
}
