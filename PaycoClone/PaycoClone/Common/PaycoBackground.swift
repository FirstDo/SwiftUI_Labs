import SwiftUI

struct PaycoBackground: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(20)
      .background(RoundedRectangle(cornerRadius: 20).fill(.secondary.opacity(0.1)))
  }
}

extension View {
  func paycoBackground() -> some View {
    modifier(PaycoBackground())
  }
}
