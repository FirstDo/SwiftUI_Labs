import SwiftUI

@main
struct MyApp: App {
    
    @State private var selectedTab: TabItem = .home
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
