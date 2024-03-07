import SwiftUI

struct KfImage: View {
  
  let urlString: String
  @State private var image: UIImage?
  
  var body: some View {
    if let image {
      Image(uiImage: image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .onDisappear {
          self.image = nil
        }
    } else {
      ProgressView()
        .task {
          do {
            let image = try await ImageDownloader.shared.image(from: URL(string: urlString)!)
            self.image = image
          } catch {
            print("error:", error.localizedDescription)
          }
        }
    }
  }
}

#Preview {
  KfImage(urlString: "https://picsum.photos/id/237/200/300")
    .frame(width: 300, height: 300)
}
