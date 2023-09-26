import Foundation

struct MoreData {
  let imageName: String
  let title: String
  let description: String
  
  static var mock: [MoreData] = [
    .init(imageName: "ex1", title: "심방세동 부담에 관하여 알아보기", description: "심방세동 부담의 개념 및 주의해야 하는 이유"),
    .init(imageName: "ex2", title: "유산소 피트니스가 낮은 경우 무엇을 의미하는지 알아보기", description: "이와 관련하여 할 수 있는 일에 대해서 알아봅니다"),
    .init(imageName: "ex3", title: "심박수 이해하기", description: "심박수가 높거나 낮으면 무엇을 의미하는지 알아봅니다.")
  ]
}
