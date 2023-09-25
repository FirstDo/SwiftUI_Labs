import Foundation

struct HeartRate {
  let title: String
  let time: String
  let heartRateTime: String
  let value: String
  let unit: String
  let description: String
  
  init(title: String, time: String, heartRateTime: String? = nil, value: String, unit: String? = nil, description: String? = nil) {
    self.title = title
    self.time = time
    self.heartRateTime = heartRateTime ?? ""
    self.value = value
    self.unit = unit ?? ""
    self.description = description ?? ""
  }
  
  static var mock: [(section: String, [Self])] {
    [
      (
        "심장",
        [
          .init(title: "심박수", time: "15:30", heartRateTime: "최근", value: "74", unit: "BPM"),
          .init(title: "심박 변이", time: "12:47", heartRateTime: "평균", value: "52", unit: "밀리초"),
          .init(title: "휴식기 심박수", time: "12:28", value: "73", unit: "BPM"),
        ]
      ),
      
      (
        "최근 7일",
        [
          .init(title: "걷기 심박수 평균", time: "어제", value: "109", unit: "BPM"),
        ]
      ),
      
      (
        "최근 30일",
        [
          .init(title: "유산소 피트니스", time: "9월 11일", value: "낮음", description: "36.8 최대산소섭취량"),
        ]
      ),
      
      (
        "최근 12개월",
        [
          .init(title: "고 심박수 알림", time: "7월 18일",value: "1"),
          .init(title: "심박수 회복", time: "6월 7일", value: "24", unit: "BPM"),
        ]
      ),
      
      (
        "이전 요약",
        [
          .init(title: "유산소 피트니스 알림", time: "2022년 7월", value: "1"),
        ]
      )
    ]
  }
}
