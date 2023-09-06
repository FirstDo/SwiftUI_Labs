import SwiftUI

struct ContentView: View {
  @State private var password = ""

  var body: some View {
    SecureField("Password", text: $password)
      .textFieldStyle(.roundedBorder)
      .padding()
      .cornerRadius(10)
      .shadow(radius: 10)
      .padding()
      .frame(width: 300)
      .padding(.bottom, 50)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
