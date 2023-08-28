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
    .padding(20)
    .background(RoundedRectangle(cornerRadius: 20).fill(.secondary.opacity(0.1)))
  }
}

struct RewardView_Previews: PreviewProvider {
  static var previews: some View {
    RewardRow()
      .previewLayout(.sizeThatFits)
  }
}
