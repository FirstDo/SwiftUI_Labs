import SwiftUI

@main
struct MyApp: App {
  @State var selection: Int = 1
  var body: some Scene {
    WindowGroup {
      TabView(selection: $selection) {
        Color.black
          .tabItem { Label("혜택", systemImage: "barcode.viewfinder") }
          .tag(0)
        MainView()
          .tabItem { Label("포인트", systemImage: "barcode.viewfinder") }
          .tag(1)
        
        Color.black
          .tabItem { Label("결제", systemImage: "barcode.viewfinder") }
          .tag(2)
        
        Color.black
          .tabItem { Label("금융", systemImage: "barcode.viewfinder") }
          .tag(3)
        
        Color.black
          .tabItem { Label("전체", systemImage: "barcode.viewfinder") }
          .tag(4)
      }
      .tint(.red)
    }
  }
}
