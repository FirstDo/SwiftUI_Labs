import SwiftUI

struct BrandOfMonth2View: View {
  @State private var items = PointItem.allCases
  
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
          LazyHStack(alignment: .bottom) {
            ForEach(items) { item in
              VStack {
                if item == .애플 || item == .테슬라 {
                  NewLabel()
                }
                Image(item.logoName)
                  .resizable()
                  .frame(width: 70, height: 70)
                  .clipShape(Circle())
                  .overlay(Circle().stroke(Color.white))
              }
            }
          }
        }
      }
      .padding(20)
      .background(RoundedRectangle(cornerRadius: 20).fill(.secondary.opacity(0.1)))
      
      Text("보러가기")
        .font(.callout)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 15).fill(.secondary.opacity(0.1)))
        .offset(x: -20, y: 20)
    }
  }
}

struct BrandOfMonth2View_Previews: PreviewProvider {
  static var previews: some View {
    BrandOfMonth2View()
      .previewLayout(.sizeThatFits)
  }
}
