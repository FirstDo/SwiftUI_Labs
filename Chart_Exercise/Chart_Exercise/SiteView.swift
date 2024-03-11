import Foundation

struct SiteView: Identifiable {
  var id = UUID().uuidString
  var hour: Date
  var views: Double
  var animate = false
}

extension Date {
  func updateHour(value: Int) -> Date {
    let calendar = Calendar.current
    return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
  }
}

var sample_analytics: [SiteView] = [
  .init(hour: Date().updateHour(value: 8), views: 1500),
  .init(hour: Date().updateHour(value: 9), views: 2625),
  .init(hour: Date().updateHour(value: 10), views: 7500),
  .init(hour: Date().updateHour(value: 11), views: 3688),
  .init(hour: Date().updateHour(value: 12), views: 2988),
  .init(hour: Date().updateHour(value: 13), views: 3289),
  .init(hour: Date().updateHour(value: 14), views: 4500),
  .init(hour: Date().updateHour(value: 15), views: 6788),
  .init(hour: Date().updateHour(value: 16), views: 9988),
  .init(hour: Date().updateHour(value: 17), views: 7866),
  .init(hour: Date().updateHour(value: 18), views: 1989),
  .init(hour: Date().updateHour(value: 19), views: 6456),
  .init(hour: Date().updateHour(value: 20), views: 3467)
]
