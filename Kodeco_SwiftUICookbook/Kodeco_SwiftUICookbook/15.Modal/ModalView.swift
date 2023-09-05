import SwiftUI

struct ChildView: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack {
      Text("This is a modal view")
      Button("Dismiss") {
        dismiss()
      }
    }
  }
}

struct ModalView: View {
  @Environment(\.dismiss) var dismiss
  @State private var showModal = false
  var body: some View {
    VStack {
      Button("Dismiss Modal") {
        dismiss()
      }
      Spacer()
      Button("Show Modal") {
        showModal = true
      }
    }

    .sheet(isPresented: $showModal) {
      ChildView()
        .presentationDetents([.medium])
        .presentationBackgroundInteraction(.enabled(upThrough: .medium))
    }
  }
}

struct ModalView_Previews: PreviewProvider {
  static var previews: some View {
    ModalView()
  }
}
