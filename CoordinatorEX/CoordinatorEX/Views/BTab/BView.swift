import SwiftUI
import ComposableArchitecture

class BRouter: Router {
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let v = BView(router: self)
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
}

struct BView: View {
  
  let store: StoreOf<BCore>
  @ObservedObject var viewStore: ViewStoreOf<BCore>
  
  init(router: BRouter) {
    self.store = Store(initialState: .init()) {
      BCore(router: router)
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
    .navigationTitle("B")
  }
}

struct BView_Previews: PreviewProvider {
  static var previews: some View {
    BView(router: BRouter(navigationController: UINavigationController()))
  }
}
