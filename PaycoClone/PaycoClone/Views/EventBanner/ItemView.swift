import SwiftUI

struct ItemView: View {
  let color: Color
  
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .fill(color)
  }
}


struct ItemView_Previews: PreviewProvider {
  static var previews: some View {
    ItemView(color: .red)
  }
}
