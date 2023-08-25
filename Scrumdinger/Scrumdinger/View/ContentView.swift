import SwiftUI

struct ContentView: View {
    var body: some View {
      ScrumsView(scrums: DailyScrum.sampleData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
