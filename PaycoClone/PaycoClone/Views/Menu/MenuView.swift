import SwiftUI

struct MenuView: View {
  @State private var itmes = MenuItem.allCases
  
  let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 30) {
      ForEach(itmes) { item in
        VStack {
          item.image
            .scaledToFit()
            .frame(width: 35, height: 35)
          Text(item.rawValue)
            .font(.caption2)
        }
      }
    }
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
      .previewLayout(.sizeThatFits)
  }
}
