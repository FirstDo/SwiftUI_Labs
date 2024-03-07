import SwiftUI

struct AnimalView: View {
  @EnvironmentObject var store: AppStore
  
  var body: some View {
    VStack {
      Text(store.state.currentAnimal)
      Button("Tap me") {
        store.dispatch(.getAnimal)
      }
    }
  }
}

#Preview {
  AnimalView()
}
