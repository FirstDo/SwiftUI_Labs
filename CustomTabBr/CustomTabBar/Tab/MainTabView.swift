import SwiftUI

struct MainTabView: View {
    @State private var selection: TabItem = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection) {
                MainView(color: .red)
                    .tag(TabItem.home)
                    .tabItem { Label("테스트", systemImage: "swift") }
                
                MainView(color: .blue)
                    .tag(TabItem.apple)
                    .tabItem { Label("테스트", systemImage: "swift") }
                
                MainView(color: .green)
                    .tag(TabItem.swift)
                    .tabItem { Label("테스트", systemImage: "swift") }
            }
            
            TabBar(selectedItem: $selection)
                .padding(20)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct MainView: View {
    let color: Color
    
    var body: some View {
        Rectangle().fill(color)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
