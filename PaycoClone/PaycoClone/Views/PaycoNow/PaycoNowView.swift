import SwiftUI

struct PaycoNowView: View {
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      VStack(alignment: .leading) {
        Label("지금 페이코는", systemImage: "star.square.fill")
          .symbolRenderingMode(.multicolor)
          .font(.title2)
          .bold()
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Spacer()
      }
      .frame(height: 240)
      .paycoBackground()
      
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack {
          Rectangle()
            .fill(.clear)
            .frame(width: 30)
          
          ForEach(NowPaycoItem.allCases) { item in
            Image(item.icon)
              .resizable()
              .scaledToFill()
              .frame(width: 130, height: 130)
              .cornerRadius(20)
          }
        }
      }
      .offset(y: -20)
      .frame(maxHeight: 180)
      .padding(.horizontal, -20)
    }
  }
}

struct PaycoNowView_Previews: PreviewProvider {
  static var previews: some View {
    PaycoNowView()
      .previewLayout(.sizeThatFits)
  }
}
