import SwiftUI

struct ContentView: View {
  let store = AppStore(initialState: .init(), reducer: appReducer)
  
  init() {
    store.dispatch(.getAnimal)
  }
  
  var body: some View {
    AnimalView()
      .environmentObject(store)
  }
}

#Preview {
  ContentView()
}
