import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewPreview<View: UIView>: UIViewRepresentable {
  private let makeUIViewHandler: () -> UIView

  init(makeUIView: @escaping () -> UIView) {
    self.makeUIViewHandler = makeUIView
  }

  func makeUIView(context: Context) -> UIView {
    makeUIViewHandler()
  }

  func updateUIView(_ uiView: UIView, context: Context) { }
}
#endif

extension UIButton {
  func addAction(_ completion: @escaping () -> Void) {
    let handler: UIActionHandler = { _ in
      completion()
    }
    self.addAction(UIAction(handler: handler), for: .touchUpInside)
  }
}
