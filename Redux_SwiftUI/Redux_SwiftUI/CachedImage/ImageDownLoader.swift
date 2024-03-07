import UIKit

class ImageDownloader {
  static let shared = ImageDownloader()
  private init() { }
  
  private var cache = NSCache<NSString, UIImage>()
  
  @MainActor
  func image(from url: URL) async throws -> UIImage {
    let key = NSString(string: url.absoluteString)
    
    if let cachedImage = cache.object(forKey: key) {
      return cachedImage
    }
    
    let image = try await fetchImage(with: url)
    cache.setObject(image, forKey: key)
    return image
  }
  
  private func fetchImage(with url: URL) async throws -> UIImage {
    guard let (data, response) = try? await URLSession.shared.data(from: url) else {
      throw AppError.network(.notConnected)
    }

    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200
    else {
      throw AppError.network(.inValidStatusCode)
    }

    return UIImage(data: data)!
  }
}

