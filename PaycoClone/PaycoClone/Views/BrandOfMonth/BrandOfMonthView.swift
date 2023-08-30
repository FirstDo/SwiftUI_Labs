import SwiftUI

struct BrandOfMonthView: View {
  @State private var xOffset: CGFloat = 0
  @State private var timer: Timer?
  
  @State private var offsetX: CGFloat = .zero
  
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
        
        BrandsView()
          .frame(maxWidth: .infinity)
          .frame(height: 150)
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
