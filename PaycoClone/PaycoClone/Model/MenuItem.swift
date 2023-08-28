import Foundation
import SwiftUI

enum MenuItem: String, CaseIterable, Identifiable, Equatable {
  case 송금 = "내계좌로 송금"
  case 충전 = "충전"
  case 전환 = "전환"
  case 이용 = "이용내역"
  case 이달의브랜드 = "이달의 브랜드"
  case 선물 = "포인트 선물"
  case 출금 = "ATM 출금"
  case 소득공제 = "소득공제"
  
  var id: String {
    return rawValue
  }
  
  
  var image: some View {
    switch self {
    case .송금:
      return Image(systemName: "wonsign.circle.fill")
        .resizable()
        .foregroundColor(.yellow)
    case .충전:
      return Image(systemName: "shippingbox.circle.fill")
        .resizable()
        .foregroundColor(.blue)
    case .전환:
      return Image(systemName: "star.square.fill")
        .resizable()
        .foregroundColor(.cyan)
    case .이용:
      return Image(systemName: "note.text.badge.plus")
        .resizable()
        .foregroundColor(.green)
    case .이달의브랜드:
      return Image(systemName: "icloud.square.fill")
        .resizable()
        .foregroundColor(.red)
    case .선물:
      return Image(systemName: "house.fill")
        .resizable()
        .foregroundColor(.purple)
    case .출금:
      return Image(systemName: "tag.square.fill")
        .resizable()
        .foregroundColor(.gray)
    case .소득공제:
      return Image(systemName: "note.text")
        .resizable()
        .foregroundColor(.blue)
    }
  }
}
