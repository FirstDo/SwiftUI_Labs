import SwiftUI

struct MainView: View {
    let color: Color
    
    var body: some View {
        ZStack {
            color
            
            VStack {
                Button("Hide Tab") {
                    NotiManager.post(name: Noti.hideTap)
                }
                Button("Show Tab") {
                    NotiManager.post(name: Noti.showTap)
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
