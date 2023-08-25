import SwiftUI

struct Header: View {
  var body: some View {
    HStack {
      Text("포인트")
      Spacer()
      Image(systemName: "swift")
      Image(systemName: "swift")
      Image(systemName: "swift")
    }
  }
}

struct Header_Previews: PreviewProvider {
  static var previews: some View {
    Header()
  }
}
