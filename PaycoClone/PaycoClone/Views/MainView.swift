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
        BrandOfMonthView() // TODO
        BrandOfMonth2View() // TODO
        PaycoNowView() // TODO
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
