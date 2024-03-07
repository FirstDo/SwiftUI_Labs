import Foundation

protocol Reducer<State, Action> {
  associatedtype State
  associatedtype Action
  associatedtype Dependency
  
  init(dependency: Dependency)
  
  func reduce(into state: inout State, action: Action) async -> Action?
}
