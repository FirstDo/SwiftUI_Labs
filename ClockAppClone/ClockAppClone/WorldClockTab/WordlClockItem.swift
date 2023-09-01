import Foundation

struct WorldClockItem: Identifiable, Equatable {
  let countryName: String
  let cityName: String
  let time: Date
  
  var id: String {
    return countryName + cityName
  }
  
  var diff: String {
    let temp = Int(time.timeIntervalSince(.now).rounded() / 3600)
    if temp > 0 {
      return "+\(temp)"
    } else {
      return "-\(temp)"
    }
  }
  
  static let all: [Self] = [
    .init(countryName: "대한민국", cityName: "서울", time: .now),
    .init(countryName: "", cityName: "갈라파고스 제도", time: .now.addingTimeInterval(3600 * -15)),
    .init(countryName: "과테말라", cityName: "과테말라 시티", time: .now.addingTimeInterval(3600 * -15)),
    .init(countryName: "중국", cityName: "난징", time: .now.addingTimeInterval(3600 * -1)),
    .init(countryName: "미국", cityName: "뉴욕", time: .now.addingTimeInterval(3600 * -13)),
    .init(countryName: "아일랜드", cityName: "더블린", time: .now.addingTimeInterval(3600 * -8)),
    .init(countryName: "알본", cityName: "도쿄", time: .now),
  ]
}
