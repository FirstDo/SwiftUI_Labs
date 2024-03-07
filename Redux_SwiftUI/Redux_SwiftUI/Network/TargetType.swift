import Foundation

enum HTTPTask {
  case plain
  case body(Encodable)
}

enum HTTPMethod: String {
  case get
  case post
  case put
  case delete
}

protocol TargetType {
  var baseURL: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var task: HTTPTask { get }
  var headers: [String: String]? { get }
}

extension TargetType {
  func asURLRequest() throws -> URLRequest {
    var request = URLRequest(url: URL(string: baseURL + path)!)
    request.allHTTPHeaderFields = headers
    request.httpMethod = method.rawValue
    
    switch task {
    case .plain:
      break
    case let .body(model):
      request.httpBody = model.toData()
    }
    
    return request
  }
}
