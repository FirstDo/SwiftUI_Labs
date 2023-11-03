
import SwiftUI

struct ContentView: View {
  @State var index = 0
  @State var showUpload = false
  
  var body: some View {
    VStack {
      
      if index == 0 {
        Rectangle().fill(.blue)
      } else {
        Rectangle().fill(.green)
      }
      
      Spacer()
      
      CustomTabBar(index: $index) {
        showUpload = true
      }
      .debug()
      .background(.yellow)
    }
    .fullScreenCover(isPresented: $showUpload) {
      UploadView()
        .ignoresSafeArea(edges: .bottom)
    }
  }
}

#Preview {
  ContentView()
}

struct UploadView: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      Color.black
      
      Button("X") {
        dismiss()
      }
      .padding(40)
    }
  }
}
