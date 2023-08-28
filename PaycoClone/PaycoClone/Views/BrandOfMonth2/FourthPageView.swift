import SwiftUI

struct FourthPageView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("알고 계셨나요?")
        .foregroundStyle(.secondary)
        .bold()
      
      Text("PAYCO 포인트로\n해외결제도 된다는 사실")
        .font(.title3)
        .bold()

      HStack(alignment: .top) {
        Text("해외 호텔 & 항공 예약시\n할인은 기본,\n현지화 출금까지 가능해요")
          .foregroundColor(.secondary)
        
        Spacer()
        
        Image("applePark")
          .resizable()
          .scaledToFill()
          .frame(width: 150)
          .cornerRadius(40)
      }
      
      Spacer()

      RedButton(title: "자세히 보기")
    }
    .frame(height: 320)
    .paycoBackground()
  }
}

struct FourthPageView_Previews: PreviewProvider {
    static var previews: some View {
        FourthPageView()
    }
}
