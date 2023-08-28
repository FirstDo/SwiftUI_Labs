import SwiftUI

struct NewLabel: View {
  var body: some View {
    VStack(spacing: 0) {
      Text("✨ NEW")
        .bold()
        .font(.caption2)
        .foregroundColor(.white)
        .padding(8)
        .background(Capsule().fill(Color.black))
      TriangleShape()
        .frame(width: 10, height: 10)
    }
  }
}

struct TriangleShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: .zero)
    path.addLine(to: CGPoint(x: rect.maxX, y: 0))
    path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
    path.closeSubpath()
    return path
  }
}

struct NewLabel_Previews: PreviewProvider {
  static var previews: some View {
    NewLabel()
      .previewLayout(.sizeThatFits)
  }
}
