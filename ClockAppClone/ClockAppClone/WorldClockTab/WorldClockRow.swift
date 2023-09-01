import SwiftUI

struct WorldClockRow: View {
  let item: WorldClockItem
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("오늘,\(item.diff)시간")
          .font(.caption2)
          .foregroundColor(.gray)
        Text(item.cityName)
          .bold()
          .foregroundColor(.white)
      }
      
      Spacer()
      
      Text(item.time, format: .dateTime
        .hour(.conversationalTwoDigits(amPM: .omitted))
        .minute()
      )
      .monospacedDigit()
      .foregroundColor(.white)
      .font(.largeTitle)
    }
  }
}

struct WorldClockRow_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      WorldClockRow(item: .init(countryName: "대한민국", cityName: "서울", time: .now))
      WorldClockRow(item: .init(countryName: "대한민국", cityName: "서울", time: .now.addingTimeInterval(3600 * 15)))
    }
    .background(Color.black)
    .previewLayout(.sizeThatFits)
  }
}
