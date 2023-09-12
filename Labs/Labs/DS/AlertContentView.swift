import SwiftUI

struct AlertContentView: View {
  @State var item: AlertItem?
  
  var body: some View {
    VStack {
      Button {
        item = .one
      } label: {
        Label("One", systemImage: "globe")
      }
      
      Button {
        item = .two
      } label: {
        Label("Two", systemImage: "globe")
      }
      
      Button {
        item = .three
      } label: {
        Label("Three", systemImage: "globe")
      }
    }
    .buttonStyle(.borderedProminent)
    .padding()
    .alert(
      item: $item,
      confirmAction: { item = nil },
      cancelAction: { item = nil }
    )
  }
}

struct AlertContentView_Previews: PreviewProvider {
  static var previews: some View {
    AlertContentView()
  }
}
