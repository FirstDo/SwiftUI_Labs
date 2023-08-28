import SwiftUI

struct SecondPageView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("PAYCO 결제 가능한")
        .foregroundColor(.secondary)
        .bold()
      Text("내 주변 가맹점 확인하고\n주요 브랜드에서 적립 받기")
        .font(.title3)
        .bold()

      HStack(alignment: .top) {
        Text("패션, 뷰티 브랜드부터\n집 주변 카페까지!")
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

struct SecondPageView_Previews: PreviewProvider {
    static var previews: some View {
        SecondPageView()
    }
}
