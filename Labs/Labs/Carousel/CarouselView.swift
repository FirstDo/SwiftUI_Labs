import SwiftUI

let baseURL = "http://3.38.192.126"
let url = "/api/votes"

struct VoteList: Decodable {
  let hasNext: Bool
  let votes: [Vote]
}

struct Vote: Decodable {
  let imageUrl: String
  let nickName: String
  let memberImageUrl: String
  let reviewCnt: Int
  let likeCnt: Int
  let disLikeCnt: Int
  let totalEvaludationCnt: Int
}

let colors: [Color] = [
  .red, .blue, .green, .yellow, .orange,
  .mint, .cyan, .brown, .black, .clear,
  .gray, .green, .yellow, .indigo, .pink,
  .primary, .secondary, .teal, .white
]

struct Model: Identifiable {
  let index: Int
  let id = UUID()
}

func requestModels() -> [Model] {
  [.init(index: 1),.init(index: 2),.init(index: 3),.init(index: 4),.init(index: 5) ]
}

struct MyView: View {
  var body: some View {
    GeometryReader { proxy in
      ZStack(alignment: .topLeading) {
        Image("4")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(height: proxy.size.height)
          .clipped()
        
        Capsule().fill(.red)
          .frame(width: 80, height: 30)
          .padding()
      }
      .foregroundColor(.red)
    }
  }
}

struct CarouselView: View {
  
  @State var items: [Model] = requestModels()
  
  let spacing: CGFloat = 20
  @State var currentIndex = 0
  @GestureState var dragOffset: CGFloat = .zero
  
  // 커서 기반 페이지네이션
  // 데이터가 하나 남으면 다음데이터 요청
  
  var body: some View {
    GeometryReader { proxy in
      let height = proxy.size.height
      let offsetY = CGFloat(currentIndex) * -height + dragOffset + CGFloat(currentIndex) * -spacing

      ScrollView(showsIndicators: false) {
        LazyVStack(spacing: spacing) {
          ForEach(0..<5, id: \.self) { index in
            MyView()
              .frame(width: proxy.size.width, height: proxy.size.height)
              .cornerRadius(24)
              .onAppear {
                print("\(index)")
              }
          }
        }
        .padding(proxy.size.height)
        .offset(y: offsetY)
        .animation(.default, value: offsetY)
        .gesture(
          DragGesture()
            .updating($dragOffset) { value, state, _ in
              state = value.translation.height
            }
            .onEnded { value in
              let offsetY = value.translation.height
              
              if offsetY > 0 {
                currentIndex = max(0, currentIndex - 1)
              } else {
                currentIndex = min(items.count - 1, currentIndex + 1)
              }
            }
        )
      }
      .scrollDisabled(true)
      .debug(.blue)
      .padding(-proxy.size.height)
      .debug(.red)
      .clipped()
    }
    .frame(height: 600)
    .padding(.horizontal, 20)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    CarouselView()
  }
}
