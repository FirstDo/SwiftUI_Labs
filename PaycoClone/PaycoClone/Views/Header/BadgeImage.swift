import SwiftUI

struct BadgeImage: View {
  let imageName: String
  let num: Int
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      Image(systemName: imageName)
        .resizable()
        .frame(width: 25, height: 25)
      
      Text("\(num)")
        .font(.caption2)
        .bold()
        .padding(.horizontal, 3)
        .foregroundColor(.white)
        .background(Color.red)
        .clipShape(Capsule())
        .offset(x: 5, y: -5)
    }
  }
}

struct BadgeImage_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      BadgeImage(imageName: "bell", num: 2)
      BadgeImage(imageName: "bell", num: 24)
    }
  }
}
