import SwiftUI

@main
struct MyApp: App {
  @StateObject private var modelData = ModelData()
  @State private var selection: Tab = .featured
  
  enum Tab {
    case featured
    case list
  }
  
  var body: some Scene {
    WindowGroup {
      TabView(selection: $selection) {
        CategoryHome()
          .tabItem {
            Label("Featured", systemImage: "star")
          }
          .tag(Tab.featured)
        LandmarkList()
          .tabItem {
            Label("List", systemImage: "list.bullet")
          }
          .tag(Tab.list)
      }
      .environmentObject(modelData)
    }
  }
}
