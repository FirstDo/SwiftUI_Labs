import SwiftUI

@main
struct LabsApp: App {
  var body: some Scene {
    WindowGroup {
      MyView2()
    }
  }
}

struct MyView2: View {
  @State var index = 0
  var body: some View {
    TabView(selection: $index) {
      Color.gray
        .gesture(DragGesture())
        .tag(0)
      
      Color.red
        .gesture(DragGesture())
        .tag(1)
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
}

#Preview {
  MyView2()
}
