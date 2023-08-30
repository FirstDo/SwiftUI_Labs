import SwiftUI

struct CardView: View {
  @State private var degree: Double = 10
  
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
        .shadow(color: .black.opacity(0.3), radius: 3, y: 5)
        .rotation3DEffect(.degrees(degree), axis: (x: 0.1, y: -0.8, z: 0))
        .animation(.spring(response: 2, dampingFraction: 0.2), value: degree)
    }
    .onReceive(Timer.publish(every: 2, on: .current, in: .default).autoconnect()) { _ in
      degree = degree == 10 ? -10 : 10
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
