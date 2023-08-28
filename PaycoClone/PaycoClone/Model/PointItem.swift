import Foundation

enum PointItem: String, Identifiable, CaseIterable {
  case 애플 = "애플"
  case 구글 = "구글"
  case 네이버 = "네이버"
  case 카카오 = "카카오"
  case 그린카 = "그린카"
  case 쏘카 = "쏘카"
  case 테슬라 = "테슬라"
  case 라이프시맨틱스 = "라이프시맨틱스"
  
  var id: UUID {
    return UUID()
  }
  
  static var firstItems: [Self] {
    Array(PointItem.allCases[0..<4])
  }
  
  static var secondItems: [Self] {
    Array(PointItem.allCases[4..<8])
  }
  
  var logoName: String {
    switch self {
    case .애플:
      return "apple"
    case .구글:
      return "google"
    case .네이버:
      return "naver"
    case .카카오:
      return "kakao"
    case .그린카:
      return "greencar"
    case .쏘카:
      return "socar"
    case .테슬라:
      return "tesla"
    case .라이프시맨틱스:
      return "ls"
    }
  }
}
