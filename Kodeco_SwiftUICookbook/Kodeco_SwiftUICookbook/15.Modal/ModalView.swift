import SwiftUI

struct ModalView: View {
  @State private var showModal = false

  var body: some View {
    Button("Show Modal") {
      showModal = true
    }
    .sheet(isPresented: $showModal) {
      List(0..<50) {
        Text("\($0)")
      }
      .presentationDetents([.medium, .large])
      .presentationContentInteraction(.scrolls)
    }
  }
}

struct ModalView_Previews: PreviewProvider {
  static var previews: some View {
    ModalView()
  }
}
