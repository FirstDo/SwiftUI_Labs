import Foundation
import SwiftUI

enum EventItem: String, Identifiable, CaseIterable {
  case red = "red"
  case blue = "blue"
  case black = "black"
  case orange = "orange"
  case green = "green"
  case purple = "purple"
  
  var id: UUID {
    return UUID()
  }
  
  var color: Color {
    switch self {
    case .red:
      return .red
    case .blue:
      return .blue
    case .black:
      return .black
    case .orange:
      return .orange
    case .green:
      return .green
    case .purple:
      return .purple
    }
  }
  
  static var carousels: [Self] {
    [.purple] + Self.allCases + [.red]
  }
}
