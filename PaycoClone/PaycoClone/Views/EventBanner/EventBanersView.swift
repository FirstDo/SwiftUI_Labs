import SwiftUI

struct EventBanersView<Content: View>: View {
  let pageCount: Int
  let visibleEdgeSpace: CGFloat
  let spacing: CGFloat
  let content: (Int) -> Content
  
  @GestureState var dragOffset: CGFloat = 0
  @State private var currentIndex = 0
  
  init(
    pageCount: Int,
    visibleEdgeSpace: CGFloat,
    spacing: CGFloat,
    @ViewBuilder content: @escaping (Int) -> Content
  ) {
    self.pageCount = pageCount
    self.visibleEdgeSpace = visibleEdgeSpace
    self.spacing = spacing
    self.content = content
  }
  
  var body: some View {
    GeometryReader { proxy in
      let baseOffset = spacing + visibleEdgeSpace
      let pageWidth = proxy.size.width - (visibleEdgeSpace + spacing) * 2
      
      let offsetX = baseOffset + CGFloat(currentIndex) * -pageWidth + dragOffset + CGFloat(currentIndex) * -spacing + dragOffset
      
//      let _ = print(baseOffset, pageWidth, offsetX)
      
      HStack(spacing: spacing) {
        ForEach(0..<pageCount) { index in
          content(index)
            .frame(width: pageWidth, height: proxy.size.height)
        }
        .contentShape(Rectangle())
      }
      .offset(x: offsetX)
      .animation(.default, value: offsetX)
      .gesture(
        DragGesture()
          .updating($dragOffset) { value, out, _ in
            out = value.translation.width
          }
          .onEnded { value in
            let offsetX = value.translation.width
            let progress = -offsetX / pageWidth
            let increment: Int = Int(ceil(progress))
//            if progress < 0 {
//              increment = -Int(ceil(-progress))
//            } else {
//              increment = Int(ceil(progress))
//            }
            
            print(offsetX, progress, increment)
            
            currentIndex = max(min(currentIndex + increment, pageCount - 1), 0)
          }
      )
    }
  }
}

struct EventBanersView_Previews: PreviewProvider {
  static var previews: some View {
    EventBanersView<ItemView>(pageCount: EventItem.allCases.count, visibleEdgeSpace: 10, spacing: 10) { index in
      ItemView(color: EventItem.allCases[index].color)
    }
  }
}
