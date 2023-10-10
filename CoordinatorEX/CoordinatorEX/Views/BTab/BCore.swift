import SwiftUI
import ComposableArchitecture

struct BCore: Reducer {
  let router: BRouter
  
  struct State: Equatable {

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
