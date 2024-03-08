import SwiftUI

@main
struct Redux_SwiftUIApp: App {
  var body: some Scene {
    WindowGroup {
      GeometryReader {
        TagListView(
          tags: ["short", "tag1", "loooooooong", "s", "normal","tag2", "한글태그", "english tag", "tag3", "tag4", "tag5", "last tag"],
          width: $0.size.width
        )
      }
      .border(Color.black)
      .clipped()
    }
  }
}
