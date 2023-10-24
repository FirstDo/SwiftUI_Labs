//
//  AView.swift
//  CoordinatorEX
//
//  Created by LS-MAC-00213 on 2023/10/22.
//

import SwiftUI
import ComposableArchitecture

struct ACore: Reducer {
  struct State: Equatable {
    
  }
  
  let router: ARouter
  
  init(router: ARouter) {
    self.router = router
  }
  
  enum Action: Equatable {
    case push
    case modal
    case pop
    case popToRoot
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .push:
      router.pushA()
    case .modal:
      router.modalA()
    case .pop:
      router.pop()
    case .popToRoot:
      router.popToRoot()
    }
    return .none
  }
}

struct AView: View {
  let store: StoreOf<ACore>
  
  init(router: ARouter) {
    self.store = .init(initialState: .init()) {
      ACore(router: router)
    }
  }
  
  var body: some View {
    Button("push") {
      store.send(.push)
    }
    
    Button("show") {
      store.send(.modal)
    }
    
    Button("pop") {
      store.send(.pop)
    }
    
    Button("popToRoot") {
      store.send(.popToRoot)
    }
  }
}

extension View {
  var toVC: UIViewController {
    return UIHostingController(rootView: self)
  }
}
