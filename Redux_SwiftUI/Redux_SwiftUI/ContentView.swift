import SwiftUI

struct ContentView: View {
  @StateObject var store: StoreOf<NameReducer> = .init(
    state: .init(name: "도연"),
    reducer: NameReducer(dependency: .init(nameRepo: NameRepo()))
  )
  
  var body: some View {
    VStack {
      Text(store.state.name)
      
      Button("change name") {
        store.send(action: .changeName)
      }
    }
  }
}

#Preview {
  ContentView(store: .init(
    state: .init(name: "도연"),
    reducer: NameReducer(dependency: .init(nameRepo: NameRepo()))
  ))
}
