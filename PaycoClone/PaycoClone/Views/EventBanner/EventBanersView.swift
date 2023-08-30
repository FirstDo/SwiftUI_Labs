import SwiftUI
import Combine

struct EventBanersView<Content: View>: View {
  let pageCount: Int
  let sideSpacing: CGFloat
  let spacing: CGFloat
  let content: (Int) -> Content
  
  @GestureState var dragOffset: CGFloat = 0
  @State private var currentIndex = 0
  @State private var globalOffsetX: CGFloat = .zero
  
  init(
    pageCount: Int,
    sideSpacing: CGFloat,
    spacing: CGFloat,
    @ViewBuilder content: @escaping (Int) -> Content
  ) {
    self.pageCount = pageCount
    self.sideSpacing = sideSpacing
    self.spacing = spacing
    self.content = content
  }
  
  var body: some View {
    GeometryReader { proxy in
      let pageWidth = proxy.size.width - (sideSpacing + spacing) * 2
      
      HStack(spacing: spacing) {
        ForEach(0..<pageCount, id: \.self) { index in
          content(index)
            .frame(width: pageWidth, height: proxy.size.height)
        }
        .contentShape(Rectangle())
      }
      .offset(x: globalOffsetX)
      .gesture(
        DragGesture()
          .updating($dragOffset) { value, out, _ in
            out = value.translation.width
          }
          .onEnded { value in
            let offsetX = value.translation.width
            
            if offsetX > 0 && offsetX / pageWidth >= 0.2 {
              currentIndex -= 1
              updateOffsetX(pageWidth, animated: true)
            }
            
            if offsetX < 0 && -offsetX / pageWidth >= 0.2 {
              currentIndex += 1
              updateOffsetX(pageWidth, animated: true)
            }
            
            // 애니메이션 주면 안됨
            if currentIndex <= 0 {
              currentIndex = pageCount - 2
              updateOffsetX(pageWidth)
            }
            
            if currentIndex >= pageCount - 1 {
              currentIndex = 1
              updateOffsetX(pageWidth)
            }
          }
      )
      .onAppear {
        currentIndex = 1
        updateOffsetX(pageWidth)
      }
      .onReceive(Timer.publish(every: 1, on: .main, in: .default).autoconnect()) { _ in
        currentIndex += 1
        updateOffsetX(pageWidth, animated: true)
    
        if currentIndex == pageCount - 1 {
          currentIndex = 1
          updateOffsetX(pageWidth)
        }
      }
    }
  }
  
  func updateOffsetX(_ pageWidth: CGFloat, animated: Bool = false) {
    if animated {
      withAnimation(.spring()) {
        globalOffsetX = spacing + sideSpacing + CGFloat(currentIndex) * -pageWidth + dragOffset + CGFloat(currentIndex) * -spacing + dragOffset
      }
    } else {
      globalOffsetX = spacing + sideSpacing + CGFloat(currentIndex) * -pageWidth + dragOffset + CGFloat(currentIndex) * -spacing + dragOffset
    }
  }
}

struct EventBanersView_Previews: PreviewProvider {
  static var previews: some View {
    EventBanersView<ItemView>(pageCount: EventItem.allCases.count, sideSpacing: 10, spacing: 10) { index in
      ItemView(color: EventItem.allCases[index].color)
    }
  }
}
