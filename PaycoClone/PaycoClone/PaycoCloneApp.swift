import SwiftUI
import UIKit

@main
struct MyApp: App {
  var body: some Scene {
    WindowGroup {
      TabView {
        Color.black
          .tabItem { Label("혜택", systemImage: "barcode.viewfinder") }
        MainView()
          .ignoresSafeArea(.all, edges: .top)
          .tabItem { Label("포인트", systemImage: "barcode.viewfinder") }
        
        Color.black
          .tabItem { Label("결제", systemImage: "barcode.viewfinder") }
        
        Color.black
          .tabItem { Label("금융", systemImage: "barcode.viewfinder") }
        
        Color.black
          .tabItem { Label("전체", systemImage: "barcode.viewfinder") }
      }
      .tint(.red)
    }
  }
}
