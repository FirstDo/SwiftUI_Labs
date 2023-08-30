import SwiftUI

struct BrandsView: View {
  
  @State private var items: [PointItem] = PointItem.allCases + PointItem.allCases + PointItem.allCases + PointItem.allCases + PointItem.allCases + PointItem.allCases + PointItem.allCases + PointItem.allCases + PointItem.allCases + PointItem.allCases + PointItem.allCases + PointItem.allCases
  @State private var offsetX: CGFloat = .zero

  var body: some View {
    ScrollViewReader { proxy in
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(alignment: .bottom) {
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
            .id(index)
            .onAppear {
              
              if index == items.count - 1 {
                items.append(contentsOf: PointItem.allCases)
              }
            }
          }
        }
        .offset(x: offsetX)
        .animation(.default, value: offsetX)
      }
      .onReceive(Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()) { _ in
        offsetX -= 0.2
      }
      .onAppear {
        for i in 1...10 {
          proxy.scrollTo(50 * i)
        }
      }
    }
  }
}

struct BrandsView_Previews: PreviewProvider {
  static var previews: some View {
    BrandsView()
  }
}
