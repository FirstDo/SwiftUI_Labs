import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

struct AppState {
  var currentAnimal = ""
}

enum AppAction {
  case getAnimal
}

func appReducer(state: inout AppState, action: AppAction) -> Void {
  switch action {
  case .getAnimal:
    state.currentAnimal = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Racon"].randomElement()!
  }
}

typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject {
  @Published private(set) var state: State
  
  private let reducer: Reducer<State, Action>
  
  init(initialState: State, reducer: @escaping Reducer<State, Action>) {
    self.state = initialState
    self.reducer = reducer
  }
  
  func dispatch(_ action: Action) {
    reducer(&state, action)
  }
}
