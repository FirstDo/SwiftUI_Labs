import SwiftUI
import Foundation

struct MainTabView: View {
    @State private var selection: TabItem = .home
    @State private var isShowTab = true
    
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
            
            if isShowTab {
                TabBar(selectedItem: $selection)
                    .padding(20)
                    .transition(.move(edge: .bottom))
                    .animation(.spring(response: 0.2))
                    .zIndex(1)
            }
        }
        .onReceive(NotiManager.publisher(for: Noti.hideTap)) { _ in
            isShowTab = false
            
        }
        .onReceive(NotiManager.publisher(for: Noti.showTap)) { _ in
            isShowTab = true
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
