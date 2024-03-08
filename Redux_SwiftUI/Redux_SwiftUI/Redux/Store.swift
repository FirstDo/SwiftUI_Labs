import Foundation

typealias StoreOf<R: Reducer> = Store<R.State, R.Action>

final class Store<State, Action>: ObservableObject {
  @Published private(set) var state: State
  
  private let reducer: any Reducer<State, Action>
  
  init(state: State, reducer: any Reducer<State, Action>) {
    self.state = state
    self.reducer = reducer
  }
  
  @MainActor
  func send(action: Action) {
    Task {
      if let stream = await reducer.reduce(into: &state, action: action) {
        send(action: stream)
      }
    }
  }
}
