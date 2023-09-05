import SwiftUI

struct ModalView: View {
  @State private var isShowingDialog = false
  var body: some View {
    Button("Empty Trash") {
      isShowingDialog = true
    }
    .confirmationDialog(
      "Are you sure you want to empty the trash?",
      isPresented: $isShowingDialog,
      titleVisibility: .visible
    ) {
      Button("Empty Trash", role: .destructive) {
        // Handle empty trash action.
      }
      Button("Cancel", role: .cancel) {
        isShowingDialog = false
      }
    }
  }
}

struct ModalView_Previews: PreviewProvider {
  static var previews: some View {
    ModalView()
  }
}
