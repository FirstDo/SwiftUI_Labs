
import SwiftUI

struct CustomTabBar: View {
  @Binding var index: Int
  
  let action: () -> Void
  
  var body: some View {
    HStack(spacing: 0) {
      Image(systemName: index == 0 ? "heart.fill" : "heart")
        .resizable()
        .scaledToFit()
        .padding(4)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
          index = 0
        }
      
      Image(systemName: index == 1 ? "plus.circle.fill" : "plus.circle")
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .padding(4)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
          action()
        }
      
      Image(systemName: index == 2 ? "star.fill" : "star")
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .padding(4)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
          index = 2
        }
    }
    .frame(height: 60)
  }
}

#Preview {
  CustomTabBar(index: .constant(0), action: {})
}
