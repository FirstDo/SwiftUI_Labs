import UIKit
import SwiftUI
import SnapKit

class MyButton: UIButton {

  init() {
    super.init(frame: .init(x: 0, y: 0, width: 50, height: 50))
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    self.setImage(UIImage(systemName: "swift"), for: .normal)
    self.setTitle("dudu", for: .normal)
    self.setTitleColor(.red, for: .normal)
    self.alignVertical(spacing: 10)
    self.size(to: 100)
  }
}

struct MyButtonView: UIViewRepresentable {
  func makeUIView(context: Context) -> UIButton {
    return MyButton()
  }
  
  func updateUIView(_ uiView: UIButton, context: Context) {
    
  }
}

#Preview {
  MyButtonView()
    .debug()
}

public extension UIButton {
  /// image, text가 Vertical 정렬된 버튼을 만듬
  func alignVertical(spacing: CGFloat = 4.0) {
    guard let image = self.imageView?.image else { return }
    guard let titleLabel = self.titleLabel else { return }
    guard let titleText = titleLabel.text else { return }
    
    let titleSize = titleText.size(withAttributes: [
      NSAttributedString.Key.font: titleLabel.font as Any
    ])
    
    titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
    imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
  }
  
  /// button image의 크기를 조절
  func imageSize(to size: CGFloat) {
    guard let imageView = self.imageView else { return }

    imageView.contentMode = .scaleAspectFit
//    imageView.snp.makeConstraints {
//      $0.width.height.equalTo(size)
//    }
  }

  /// button의 크기를 조절
  func size(to size: CGFloat) {
    self.snp.makeConstraints {
      $0.width.height.equalTo(size)
    }
  }
}
