import SwiftUI

struct ThirdPageView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("이달의 브랜드 확인하고\n더 많은 포인트를 적립 받으세요")
        .font(.title3)
        .bold()

      HStack(alignment: .top) {
        Text("결제할 때마다\n최대 15%까지 적립!")
          .foregroundColor(.secondary)
        
        Spacer()
        
        Image(systemName: "flag.checkered.2.crossed")
          .resizable()
          .scaledToFill()
          .foregroundStyle(.blue, .white)
          .frame(width: 150)
      }
      
      Spacer()

      RedButton(title: "이달의 브랜드 보기")
    }
    .frame(height: 320)
    .paycoBackground()
  }
}

struct ThirdPageView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPageView()
    }
}
