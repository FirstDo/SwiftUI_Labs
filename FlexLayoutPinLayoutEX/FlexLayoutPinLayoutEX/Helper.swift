import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewPreview<View: UIView>: UIViewRepresentable {
  private let makeUIViewHandler: () -> UIView
  private let updateUIViewHandler: (UIView) -> Void

  init(
    makeUIView: @escaping () -> UIView,
    updateUIView: @escaping (UIView) -> Void = { _ in }
  ) {
    self.makeUIViewHandler = makeUIView
    self.updateUIViewHandler = updateUIView
  }

  func makeUIView(context: Context) -> UIView {
    makeUIViewHandler()
  }

  func updateUIView(_ uiView: UIView, context: Context) {
    updateUIViewHandler(uiView)
  }
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
