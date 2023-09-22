import UIKit

class Example1VC: UIViewController {
  override func loadView() {
    super.loadView()
    
    view = MainView(frame: view.frame)
  }
}

fileprivate class MainView: UIView {
  
  private let imageview = UIImageView(image: UIImage(systemName: "swift"))
  private let segmentControl: UISegmentedControl = {
    return $0
  }(UISegmentedControl(items: ["Intro", "FlexLayout", "PinLayout"]))
  
  private let label: UILabel = {
    $0.textColor = .label
    $0.text = "Flexbox layouting is simple, powerfull and fast\nFlexLayout syntax is concise and chainable."
    $0.numberOfLines = 0
    return $0
  }(UILabel())
  
  private let bottomLabel: UILabel = {
    $0.textColor = .label
    $0.text = "FlexLayout/yoga is incredibly fast, its even faster then manual layout"
    $0.numberOfLines = 0
    return $0
  }(UILabel())
  
  private let rootFlexContainer = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    
    addSubview(rootFlexContainer)

    rootFlexContainer.flex.direction(.column).padding(12).define { flex in
      flex.addItem().direction(.row).define { flex in
        flex.addItem(imageview).width(100).aspectRatio(of: imageview)
        
        flex.addItem().direction(.column).paddingLeft(12).grow(1).shrink(1).define { flex in
          flex.addItem(segmentControl).marginBottom(12).grow(1)
          flex.addItem(label)
        }
      }
      
      flex.addItem().height(1).marginTop(12).backgroundColor(.lightGray)
      flex.addItem(bottomLabel).marginTop(12)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    rootFlexContainer.pin.top().horizontally().margin(pin.safeArea)
    rootFlexContainer.flex.layout(mode: .adjustHeight)
    
  }
}
