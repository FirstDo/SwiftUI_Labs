import SwiftUI

@main
struct MyApp: App {
  @StateObject private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      LandmarkList()
        .environmentObject(modelData)
    }
  }
}
