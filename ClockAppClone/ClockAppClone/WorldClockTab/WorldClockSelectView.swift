import SwiftUI
import ComposableArchitecture

import SwiftUI
import ComposableArchitecture

struct WorldClockSelectCore: Reducer {
  struct State: Equatable {
    let items: [WorldClockItem]
    var query = ""
    
    var filteredItems: [WorldClockItem] {
      if query == "" { return items.sorted { $0.countryName < $1.countryName } }
      return items
        .filter { ($0.cityName + $0.countryName).lowercased().contains(query.lowercased()) }
        .sorted { $0.countryName < $1.countryName }
    }
  }
  
  enum Action: Equatable {
    case cancelTapped
    case xTapped
    case setQuery(String)
    case cellTapped
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
  }
}

struct WorldClockSelectView: View {
  let store: StoreOf<WorldClockSelectCore>
  @ObservedObject var viewStore: ViewStoreOf<WorldClockSelectCore>
  
  init(item: [WorldClockItem]) {
    let remainItems = Array(Set(WorldClockItem.allCases).subtracting(item))
    self.store = .init(initialState: WorldClockSelectCore.State(items: remainItems)) {
      WorldClockSelectCore()
    }
    self.viewStore = ViewStore(self.store, observe: { $0 })
  }
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(viewStore.filteredItems) { item in
          let _ = print(item.cityName.first)
          Text(item.cityName + "," + item.countryName)
        }
      }
      .listStyle(.plain)
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("도시선택")
    }
  }
}

struct WorldClockSelectView_Previews: PreviewProvider {
  static var previews: some View {
      WorldClockSelectView(item: [.서울])
  }
}
