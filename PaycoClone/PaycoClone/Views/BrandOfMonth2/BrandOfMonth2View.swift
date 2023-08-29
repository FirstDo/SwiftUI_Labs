import SwiftUI

struct BrandOfMonth2View: View {
  @State private var selection = 1
  
  var body: some View {
    VStack {
      TabView(selection: $selection) {
        FourthPageView()
          .padding(.horizontal, 20)
          .tag(0)
        
        FirstPageView()
          .padding(.horizontal, 20)
          .tag(1)

        SecondPageView()
          .padding(.horizontal, 20)
          .tag(2)
        
        ThirdPageView()
          .padding(.horizontal, 20)
          .tag(3)
        
        FourthPageView()
          .padding(.horizontal, 20)
          .tag(4)
        
        FirstPageView()
          .padding(.horizontal, 20)
          .tag(5)
      }
      .tabViewStyle(.page(indexDisplayMode: .never))
      .onChange(of: selection) { newValue in
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
          if selection == 0 { selection = 4 }
          if selection == 5 { selection = 1 }
        }
      }
      
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
