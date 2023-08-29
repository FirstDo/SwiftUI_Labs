import SwiftUI

struct PointIndexHeader: View {
  let items = ["전체", "온라인", "오프라인", "New"]
  @State private var selection = "전체"
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 15) {
        ForEach(items, id: \.self) { item in
          Text(item)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .foregroundColor(selection == item ? .white : .black)
            .fontWeight(selection == item ? .bold : .regular)
            .background(Capsule().fill(selection == item ? .black : .secondary.opacity(0.2)))
            .onTapGesture {
              selection = item
            }
        }
      }
    }
  }
}

struct PointIndexHeader_Previews: PreviewProvider {
  static var previews: some View {
    PointIndexHeader()
  }
}
