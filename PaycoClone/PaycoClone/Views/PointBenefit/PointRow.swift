import SwiftUI

struct PointRow: View {
  let item: PointItem
  var body: some View {
    HStack(spacing: 10) {
      Image(item.logoName)
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .frame(width: 50, height: 50)
      
      VStack(alignment: .leading) {
        Text(item.rawValue + " 결제 시")
        
        Text("최대 \((1...50).randomElement()!)% 할인")
          .bold()
      }
      Spacer()
      Image(systemName: "chevron.right")
        .foregroundColor(.secondary)
    }
  }
}

struct PointRow_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      VStack {
        ForEach(PointItem.allCases) { item in
          PointRow(item: item)
        }
      }
    }
    .previewLayout(.sizeThatFits)
  }
}
