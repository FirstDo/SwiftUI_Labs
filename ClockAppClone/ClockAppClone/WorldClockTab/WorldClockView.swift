import SwiftUI
import ComposableArchitecture

struct WorldClockCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action: Equatable {
    
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    return .none
  }
}

struct WorldClockView: View {
  let store: StoreOf<WorldClockCore>
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .navigationTitle("세계 시계")
      .navigationBarTitleDisplayMode(.large)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          EditButton()
            .foregroundColor(.orange)
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            
          } label: {
            Image(systemName: "plus")
              .foregroundColor(.orange)
          }
        }
      }
  }
}

struct WorldClockView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      WorldClockView(
        store: .init(initialState: .init()) {
        WorldClockCore()
      })
    }
  }
}
