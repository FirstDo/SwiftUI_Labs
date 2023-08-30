import SwiftUI

struct VerticalPageView: View {
  @State var items: [Color] = [.red, .blue, .green, .yellow, .black, .orange, .cyan, .mint, .brown]
  
  
  var body: some View {
    ZStack {
      Color.gray.opacity(0.1)
      
      VStack {
        PageView(items: $items, spacing: 10)
          .frame(height: 500)
          .padding(.horizontal)
        
        Button(action: {}) {
          Text("살")
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity).background(.red)
            .clipShape(Capsule())
            .padding(.horizontal, 20)
        }
        Button(action: {}) {
          Text("말")
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity).background(.blue)
            .clipShape(Capsule())
            .padding(.horizontal, 20)
        }
      }
    }
  }
}

struct PageView: View {
  @Binding var items: [Color]
  let spacing: CGFloat
  @State var currentIndex = 0
  @GestureState var dragOffset: CGFloat = 0
  
  var body: some View {
    GeometryReader { proxy in
      
      let height = proxy.size.height
      let offsetY = CGFloat(currentIndex) * -height + dragOffset + CGFloat(currentIndex) * -spacing
      
      ScrollView(showsIndicators: false) {
        VStack(spacing: spacing) {
          ForEach(0..<items.count, id: \.self) { index in
            items[index]
              .frame(height: height)
              .frame(maxWidth: .infinity)
              .cornerRadius(20)
          }
          .contentShape(Rectangle())
        }
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
        .onChange(of: currentIndex) { newValue in
          if currentIndex == items.count - 2 {
            items.append(items.randomElement()!)
          }
        }
      }
      .scrollDisabled(true)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    VerticalPageView()
  }
}
