import SwiftUI

struct PointBenefitView: View {
  @State var items = PointItem.firstItems
  
  var body: some View {
    VStack(alignment: .leading, spacing: 30) {
      Text("8월 포인트 결제 혜택")
        .font(.title2)
        .bold()
      
      PointIndexHeader()
        .frame(height: 50)
      
      VStack {
        ForEach(items) { item in
          PointRow(item: item)
        }
        
        MoreButton {
          withAnimation {
            if items == PointItem.firstItems {
              items = PointItem.secondItems
            } else {
              items = PointItem.firstItems
            }
          }
        }
      }
    }
    .padding(20)
    .background(RoundedRectangle(cornerRadius: 20).fill(.secondary.opacity(0.1)))
  }
}

struct PointBenefitView_Previews: PreviewProvider {
  static var previews: some View {
    PointBenefitView()
      .previewLayout(.sizeThatFits)
  }
}
