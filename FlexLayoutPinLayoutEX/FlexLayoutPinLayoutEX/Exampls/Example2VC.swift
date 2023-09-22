import UIKit
import SwiftUI

import FlexLayout
import PinLayout
import SnapKit

class Example2VC: UIViewController {
  override func loadView() {
    super.loadView()
    
    view = MainView(frame: view.frame)
  }
}

fileprivate class MainView: UIView {
  
  private let rootFlexContainer = UIView()
  private let cardImageView = UIImageView(image: UIImage(systemName: "swift"))
  private let xbutton = UIButton(type: .close)
  private let label: UILabel = {
    $0.text = """
      FlexLayout으로 뷰를 만들어 봅시다
      FlexLayout으로 뷰를 만들어 봅시다
      FlexLayout으로 뷰를 만들어 봅시다
      FlexLayout으로 뷰를 만들어 봅시다
      FlexLayout으로 뷰를 만들어 봅시다
      FlexLayout으로 뷰를 만들어 봅시다
      FlexLayout으로 뷰를 만들어 봅시다
    """
    $0.textColor = .label
    $0.numberOfLines = 0
    return $0
  }(UILabel())
  
  private let confirmButton: UIButton = {
    $0.setTitle("확인", for: .normal)
    $0.setTitleColor(.label, for: .normal)
    $0.backgroundColor = .red
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 10
    return $0
  }(UIButton())
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .systemGray6
    
    addSubview(rootFlexContainer)
    rootFlexContainer.backgroundColor = .white
    rootFlexContainer.layer.cornerRadius = 20
    
    rootFlexContainer.flex.direction(.column).padding(20).justifyContent(.spaceBetween).define { flex in
      
      flex.addItem().direction(.column).define { flex in
        
        flex.addItem().direction(.column).alignItems(.center).define { flex in
          flex.addItem(cardImageView).marginTop(10).aspectRatio(1).size(150)
          flex.addItem(xbutton).position(.absolute).top(10).right(10)
        }
        
        flex.addItem(label)
          .marginTop(20).marginBottom(20)
      }
      
      flex.addItem(confirmButton)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()

    rootFlexContainer.pin.center().width(300).height(500)
    rootFlexContainer.flex.layout()
  }
}

struct MainViewPreview: PreviewProvider {
  static var previews: some View {
    UIViewPreview {
      MainView()
    }
    .previewLayout(.sizeThatFits)
  }
}

//class Example2VC: UIViewController {
//  override func loadView() {
//    super.loadView()
//
//    view = MainView(frame: view.frame)
//  }
//}
//
//fileprivate class MainView: UIView {
//
//  private let rootFlexContainer = UIView()
//
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    self.backgroundColor = .white
//
//    addSubview(rootFlexContainer)
//  }
//
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  override func layoutSubviews() {
//    super.layoutSubviews()
//
//
//  }
//}
