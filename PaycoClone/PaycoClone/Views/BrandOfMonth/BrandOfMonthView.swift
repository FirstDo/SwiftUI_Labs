import SwiftUI

struct BrandOfMonthView: View {
  @State private var items = PointItem.allCases + PointItem.allCases
  @State private var xOffset: CGFloat = 0
  @State private var timer: Timer?
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      VStack(alignment: .leading) {
        Group {
          Text("이달의 브랜드")
          Text("최대 15% 적립")
            .foregroundColor(.red)
        }
        .bold()
        .font(.title2)

        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .bottom) {
            ForEach(0..<items.count, id: \.self) { index in
              VStack {
                if items[index] == .애플 || items[index] == .테슬라 {
                  NewLabel()
                }
                
                Image(items[index].logoName)
                  .resizable()
                  .frame(width: 70, height: 70)
                  .clipShape(Circle())
                  .overlay(Circle().stroke(Color.white))
              }
            }
          }
        }
      }
      .paycoBackground()
      
      Text("보러가기")
        .font(.callout)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 15).fill(.secondary.opacity(0.1)))
        .offset(x: -20, y: 20)
    }
  }
}

struct BrandOfMonthView_Previews: PreviewProvider {
  static var previews: some View {
    BrandOfMonthView()
      .frame(height: 300)
      .previewLayout(.sizeThatFits)
  }
}
