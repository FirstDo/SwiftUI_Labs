import SwiftUI

struct MainView: View {
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 30) {
        HeaderView()
        CardView()
          .frame(height: 200)
        MenuView()
        EventBanersView()
          .padding(.horizontal, -20)
        PointBenefitView()
        RewardRow()
        BrandOfMonthView()
        BrandOfMonth2View()
        PaycoNowView()
      }
      .padding(.horizontal, 10)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
