import SwiftUI
import ComposableArchitecture

struct WorldClockCore: Reducer {
  struct State: Equatable {
    var items: [WorldClockItem] = [.서울]
  }
  
  enum Action: Equatable {
    case deleteItem(target: IndexSet)
    case moveItem(from: IndexSet, to: Int)
    case plusItem
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case let .deleteItem(indices):
      state.items.remove(atOffsets: indices)
    case let .moveItem(from, to):
      state.items.move(fromOffsets: from, toOffset: to)
    case .plusItem:
      break
    default:
      break
    }
    return .none
  }
}

struct WorldClockView: View {
  let store: StoreOf<WorldClockCore>
  @ObservedObject var viewStore: ViewStoreOf<WorldClockCore>
  @State var mode: EditMode = .inactive
  
  init() {
    self.store = Store(initialState: .init()) { WorldClockCore() }
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
  var body: some View {
    ZStack {
      Color.black
      
      List {
        ForEach(viewStore.items) { item in
          WorldClockRow(item: item, isEdit: mode == .active)
            .frame(height: 80)
        }
        .onMove { (indexSet, index) in
          store.send(.moveItem(from: indexSet, to: index))
        }
        .onDelete { indexSet in
          store.send(.deleteItem(target: indexSet))
        }
        .listRowBackground(Color.black)
        .listRowSeparatorTint(.gray.opacity(0.7))
        if viewStore.items.isEmpty {
          Text("")
            .listRowBackground(Color.black)
        }
      }
      .listStyle(.inset)
    }
    .background(Color.black)
    .scrollContentBackground(.hidden)
    .navigationTitle("세계 시계")
    .navigationBarTitleDisplayMode(.large)
    .toolbarColorScheme(.dark, for: .navigationBar)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        EditButton()
          .foregroundColor(.orange)
      }
      
      ToolbarItem(placement: .navigationBarTrailing) {
        NavigationLink(">>") {
          Color.white
            .ignoresSafeArea()
            .toolbar(.hidden, for: .tabBar)
        }
        .tint(.orange)
      }
      
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          
        } label: {
          Image(systemName: "plus")
            .foregroundColor(.orange)
        }
      }
    }
    .environment(\.editMode, $mode)
  }
}

struct WorldClockView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      WorldClockView()
    }
  }
}
