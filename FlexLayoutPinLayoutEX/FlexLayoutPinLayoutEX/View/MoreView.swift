import UIKit
import SwiftUI

final class MoreView: UIView {
  
  let root = UIView()
  let label: UILabel = {
    $0.text = "심장에 관하여"
    $0.font = .boldSystemFont(ofSize: 24)
    $0.textColor = .label
    return $0
  }(UILabel())
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    
    addSubview(root)
    
    root.flex.define {
      $0.addItem(label)
      $0.addItem(AboutHeartView(data: .mock[0]))
      $0.addItem(AboutHeartView(data: .mock[1]))
      $0.addItem(AboutHeartView(data: .mock[2]))
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    root.pin.all()
    root.flex.layout(mode: .adjustHeight)
  }
}


struct MoreView_Preview: PreviewProvider {
  static var previews: some View {
    UIViewPreview {
      MoreView()
    }
  }
}
