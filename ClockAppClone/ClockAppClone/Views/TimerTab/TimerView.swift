import SwiftUI
import ComposableArchitecture

struct TimerCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action: Equatable {
    
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    default:
      return .none
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
    
  }
}

struct TimerView: View {
  let store: StoreOf<TimerCore>
  @ObservedObject var viewStore: ViewStoreOf<TimerCore>
  
  init() {
    self.store = Store(initialState: .init()) {
      TimerCore()
    }
    self.viewStore = ViewStore(self.store, observe: { $0 })
  }
  
  var body: some View {
    Text("")
  }
}

struct TimerView_Previews: PreviewProvider {
  static var previews: some View {
    TimerView()
  }
}

