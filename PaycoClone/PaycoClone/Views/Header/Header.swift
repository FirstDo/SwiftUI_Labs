import SwiftUI

struct HeaderView: View {
  var body: some View {
    HStack(spacing: 15) {
      Text("포인트")
        .font(.largeTitle)
        .bold()
      Spacer()
      BadgeImage(imageName: "ticket", num: 24)
      BadgeImage(imageName: "bell", num: 3)
      Image(systemName: "person")
        .resizable()
        .frame(width: 25, height: 25)
      
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView()
  }
}
