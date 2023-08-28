import SwiftUI

struct BrandOfMonth2View: View {
  @State private var selection = 0
  var body: some View {
    
    VStack {
      TabView(selection: $selection) {
        FirstPageView()
          .padding(.horizontal, 20)
          .tag(0)
        SecondPageView()
          .padding(.horizontal, 20)
          .tag(1)
        ThirdPageView()
          .padding(.horizontal, 20)
          .tag(2)
        FourthPageView()
          .padding(.horizontal, 20)
          .tag(3)
      }
      .tabViewStyle(.page(indexDisplayMode: .never))
      
      TabIndex(selection: $selection, count: 4)
    }
  }
}

struct BrandOfMonth2View_Previews: PreviewProvider {
  static var previews: some View {
    BrandOfMonth2View()
      .previewLayout(.sizeThatFits)
  }
}
