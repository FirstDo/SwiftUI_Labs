
import SwiftUI

extension AnyAlertView {
  func addAction(title: String, action: @escaping () -> Void) -> AnyAlertView {
    var state = self
    state.action = action
    return state
  }
}


struct AnyAlertView: View {
  
  
  var action: (() -> Void)?
  
  var body: some View {
    HStack {
      Button("title") {
        action?()
      }
  
    }
  }
}

#Preview {
  AnyAlertView()
    .addAction(title: "??") {
      print("action")
    }
}
