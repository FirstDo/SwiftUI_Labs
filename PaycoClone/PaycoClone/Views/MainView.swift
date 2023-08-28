import SwiftUI

struct MainView: View {
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 30) {
        HeaderView()
        CardView()
          .frame(height: 200)
        MenuView()
        EventBanersView() // TODO
          .padding(.horizontal, -20)
        PointBenefitView()
        RewardRow()
        BrandOfMonthView() // TODO: auto, 무한 스크롤
        BrandOfMonth2View()
          .frame(height: 400)
          .padding(.horizontal, -20)
        PaycoNowView()
          .padding(.bottom, 20)
      }
      .padding(.horizontal, 20)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
