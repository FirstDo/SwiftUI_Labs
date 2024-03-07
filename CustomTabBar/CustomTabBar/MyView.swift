import SwiftUI

struct MyView: View {
  @State var show = true
  
  var body: some View {
    VStack {
      Button("Toggle") {
        show.toggle()
      }
      
      Rectangle().fill(.yellow)
      
      Spacer()
      
      if show {
        RoundedRectangle(cornerRadius: 20).fill(.black)
          .frame(height: 50)
      }
    }
  }
}

#Preview {
  MyView()
}
