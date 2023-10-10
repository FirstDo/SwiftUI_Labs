//
//  ACore.swift
//  CoordinatorEX
//
//  Created by LS-MAC-00213 on 2023/10/06.
//

import SwiftUI
import ComposableArchitecture

struct ACore: Reducer {
  let router: ARouter
  
  init(router: ARouter) {
    self.router = router
  }
  
  struct State: Equatable {
    let title: Int
  }
  
  enum Action: Equatable {
    case pushA
    case pushB
    case pop
    case popToRoot
    case changeTap
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .pushA:
        router.pushA()
        
      case .pushB:
        router.pushB()
        
      case .pop:
        router.pop()
        
      case .popToRoot:
        router.popToRoot()
        
      case .changeTap:
        break
      }
      
      return .none
    }
  }
}
