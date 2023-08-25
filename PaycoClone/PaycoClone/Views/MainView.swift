import SwiftUI

struct MainView: View {
  var body: some View {
    VStack {
      Header()
      CardView()
      PointBenefitView()
      RewardView()
      BrandOfMonthView()
      BrandOfMonth2View()
      PaycoNowView()
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
