import SwiftUI

struct MoreButton: View {
  @State private var index = 1
  let action: () -> Void
  
  var body: some View {
    Group {
      Text("더보기 **\(index)** ").foregroundColor(.black) +
      Text("/ 8").foregroundColor(.gray)
    }
    .monospacedDigit()
    .padding()
    .background(Capsule().fill(.white))
    .onTapGesture {
      index += 1
      if index > 8 { index = 1 }
      action()
    }
  }
}

struct MoreButton_Previews: PreviewProvider {
  static var previews: some View {
    MoreButton { }
  }
}
