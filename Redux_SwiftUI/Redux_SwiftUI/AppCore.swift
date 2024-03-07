import Foundation
import Combine

struct NameRepo {
  func makeRandomName() async -> String {
    try! await Task.sleep(for: .seconds(1))
    return "dudu no.\(Int.random(in: 1...100))"
  }
}

struct NameReducer: Reducer {
  struct State {
    var name = "dudu"
  }
  
  enum Action {
    case changeName
    case setName(String)
  }
  
  struct Dependency {
    let nameRepo: NameRepo
  }
  
  init(dependency: Dependency) {
    self.dependency = dependency
  }
  
  private let dependency: Dependency
  
  @MainActor
  func reduce(into state: inout State, action: Action) async -> Action? {
    switch action {
    case .changeName:
      state.name = "loading..."
      let result = await dependency.nameRepo.makeRandomName()
      return .setName(result)
      
    case let .setName(name):
      print(name)
      state.name = name
    }
    
    return .none
  }
}

