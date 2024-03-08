import SwiftUI

struct ImageListView: View {
  var body: some View {
    ScrollView {
      ScrollView(.horizontal) {
        LazyHStack {
          ForEach(100..<120) { num in
            KfImage(urlString: "https://picsum.photos/id/\(num)/200/200")
              .frame(width: 200, height: 200)
          }
        }
      }
    }
  }
}

#Preview {
  ImageListView()
}
