import SwiftUI

struct RewardRow: View {
  var body: some View {
    HStack {
      Image(systemName: "dollarsign.circle.fill")
        .foregroundStyle(.white, .yellow)
      Text("**PAYCO** 리워드")
      Spacer()
      Text("0 P").bold()
      Image(systemName: "chevron.forward")
        .foregroundColor(.secondary)
    }
    .paycoBackground()
  }
}

struct RewardView_Previews: PreviewProvider {
  static var previews: some View {
    RewardRow()
      .previewLayout(.sizeThatFits)
  }
}
