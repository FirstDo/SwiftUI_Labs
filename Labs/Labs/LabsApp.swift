import SwiftUI

@main
struct LabsApp: App {
  var body: some Scene {
    WindowGroup {
      TabView {
        AlertContentView()
        ButtonContentView()
      }
    }
  }
}
