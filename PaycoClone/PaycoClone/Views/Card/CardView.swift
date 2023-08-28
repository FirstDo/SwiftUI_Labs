import SwiftUI

struct CardView: View {
  var body: some View {
    ZStack(alignment: .topTrailing) {
      VStack(alignment: .leading, spacing: 0) {
        Text("PAYCO Point")
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding(.bottom, 20)
        
        HStack {
          Text("75 P")
          Image(systemName: "chevron.forward")
            .resizable()
            .frame(width: 10, height: 15)
        }
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.white)
        
        Spacer()
        
        HStack {
          Text("토스뱅크 (9920)").underline()
            .font(.caption)
          Spacer()
          cardManageView
        }
        .foregroundColor(.white)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(25)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(LinearGradient(
            gradient: Gradient(colors: [Color("subRed"), .pink]),
            startPoint: .leading,
            endPoint: .trailing
          ))
      )
      
      Image("card")
        .resizable()
        .scaledToFit()
        .frame(width: 150, height: 150)
        .offset(x: -20, y: -20)
    }
  }
}

private extension CardView {
  var cardManageView: some View {
    Text("카드 관리")
      .font(.caption)
      .padding(10)
      .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
  }
}
