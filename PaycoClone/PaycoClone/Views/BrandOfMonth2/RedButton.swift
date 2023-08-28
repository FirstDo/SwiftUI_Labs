import SwiftUI

struct RedButton: View {
  let title: String
  
  var body: some View {
    Button(action: { }) {
      HStack {
        Text(title)
        Image(systemName: "chevron.right")
      }
      .foregroundColor(.white)
      .frame(maxWidth: .infinity)
      .padding()
      .background(RoundedRectangle(cornerRadius: 15).fill(.red))
    }
  }
}

struct RedButton_Previews: PreviewProvider {
  static var previews: some View {
    RedButton(title: "이달의 브랜드 보기")
      .previewLayout(.sizeThatFits)
  }
}
