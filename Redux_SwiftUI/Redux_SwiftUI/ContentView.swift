import SwiftUI

struct ContentView: View {
  @StateObject var store: StoreOf<NameReducer> = .init(
    state: .init(name: "도연"),
    reducer: NameReducer(dependency: .init(nameRepo: NameRepo()))
  )
  
  @EnvironmentObject var coordinator: AppCoordinator
  
  private let networkManager = NetworkManager()
  
  var body: some View {
    VStack {
      Text(store.state.name)
      
      Button("change name") {
        store.send(action: .changeName)
      }
      
      Button("Back") {
        coordinator.path.removeLast()
      }
    }
    .task {
      let result = try! await networkManager.request(TodoAPI.todo(1), type: TodoResponseDTO.self)
      print(result)
    }
  }
}

#Preview {
  ContentView(store: .init(
    state: .init(name: "도연"),
    reducer: NameReducer(dependency: .init(nameRepo: NameRepo()))
  ))
}
