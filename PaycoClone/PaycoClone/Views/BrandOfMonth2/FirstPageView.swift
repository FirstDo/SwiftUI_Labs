import SwiftUI

struct FirstPageView: View {
    var body: some View {
      VStack(alignment: .leading, spacing: 20) {
        Text("이번달 받을\n리워드는 얼마?")
          .font(.title3)
          .bold()

        HStack(alignment: .top) {
          Text("오늘까지 적립된 포인트를\n확인해 보세요.")
            .foregroundColor(.secondary)
          
          Spacer()
          
          Image(systemName: "house")
            .resizable()
            .scaledToFit()
            .foregroundColor(.red)
            .frame(width: 150)
        }
        
        Spacer()

        RedButton(title: "리워드 확인하기")
      }
      .frame(height: 320)
      .paycoBackground()
    }
}

struct FirstPageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageView()
        .previewLayout(.sizeThatFits)
    }
}
