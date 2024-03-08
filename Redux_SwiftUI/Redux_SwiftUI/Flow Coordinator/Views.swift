
import SwiftUI

class AppCoordinator: ObservableObject {
  @Published var path = NavigationPath()
  
  func moveToFirst() {
    path.append(Screen.first)
  }
  
  func moveToSecond() {
    path.append(Screen.second)
  }
  
  func moveContentView() {
    path.append(Screen.content)
  }
}

struct CoordinatorView: View {
  
  @StateObject var state = AppCoordinator()
  
  var body: some View {
    NavigationStack(path: $state.path) {
      FirstView()
        .environmentObject(state)
        .navigationDestination(for: Screen.self) { content in
          switch content {
          case .first:
            FirstView().environmentObject(state)
          case .second:
            SecondView().environmentObject(state)
          case .content:
            ContentView(store: .init(
              state: .init(name: "dudu"),
              reducer: NameReducer(dependency: .init(nameRepo: NameRepo()))
            ))
            .environmentObject(state)
          }
        }
    }
  }
}

struct FirstView: View {
  
  @EnvironmentObject var coordinator: AppCoordinator
  
  var body: some View {
    VStack {
      Button("first") {
        coordinator.moveToFirst()
      }
      Button("second") {
        coordinator.moveToSecond()
      }
      Button("thrid") {
        coordinator.moveContentView()
      }
    }
  }
}

struct SecondView: View {
  @EnvironmentObject var coordinator: AppCoordinator
  
  var body: some View {
    Text("Second")
  }
}
