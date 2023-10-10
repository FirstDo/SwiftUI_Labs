import SwiftUI
import ComposableArchitecture

class ARouter: Router {
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let v = AView(router: self, title: 0)
    let vc = BaseHostingVC(rootView: v)
    navigationController.pushViewController(vc, animated: true)
  }
  
  func pushA() {
    let subRouter = ARouter(navigationController: self.navigationController)
    subRouter.start()
  }
  
  func pushB() {
    let subRouter = BRouter(navigationController: self.navigationController)
    subRouter.start()
  }
  
  func changeTab() {

  }
}

struct AView: View {
  let store: StoreOf<ACore>
  @ObservedObject var viewStore: ViewStoreOf<ACore>
  
  init(router: ARouter, title: Int) {
    self.store = Store(initialState: .init(title: title)) {
      ACore(router: router)
    }
    
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
  var body: some View {
    VStack {
      Button("Push") {
        store.send(.pushA)
      }
      
      Button("PushB") {
        store.send(.pushB)
      }
      
      Button("Pop") {
        store.send(.pop)
      }
      
      Button("Pop to Root") {
        store.send(.popToRoot)
      }
      
      Button("Change Tap") {
        store.send(.changeTap)
      }
    }
    .buttonStyle(.borderedProminent)
    .navigationTitle("A: \(viewStore.title)")
  }
}

struct AView_Previews: PreviewProvider {
  static var previews: some View {
    AView(router: ARouter(navigationController: UINavigationController()),title: 0)
  }
}
