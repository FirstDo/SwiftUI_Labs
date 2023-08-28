import SwiftUI

struct TabIndex: View {
  @Binding var selection: Int
  let count: Int
  
  var body: some View {
    HStack {
      ForEach(0..<count) { index in
        Capsule()
          .fill(index == selection ? .black: .secondary.opacity(0.1))
          .frame(width: index == selection ? 24 : 6, height: 6)
          .animation(.easeInOut(duration: 0.5), value: selection)
      }
    }
  }
}

struct TabIndex_Previews: PreviewProvider {
  static var previews: some View {
    TabIndex(selection: .constant(0), count: 4)
      .previewLayout(.sizeThatFits)
  }
}
