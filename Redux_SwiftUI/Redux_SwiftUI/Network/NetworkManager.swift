import Foundation

enum AppError: Error {
  case network(Network)
  
  enum Network {
    case notConnected
    case decodingFail
    case inValidStatusCode
  }
}

protocol Responsable: Decodable {
  associatedtype Entity
  
  static var mock: Self { get }
  var toDomain: Entity { get }
}

protocol NetworkManagerProtocol {
  @discardableResult
  func request<T: Responsable>(_ api: TargetType, type: T.Type) async throws -> T
}

struct MockNetworkManager: NetworkManagerProtocol {
  func request<T>(_ api: TargetType, type: T.Type) async throws -> T where T : Responsable {
    return type.mock
  }
}

struct NetworkManager: NetworkManagerProtocol {
  func request<T: Responsable>(_ api: TargetType, type: T.Type) async throws -> T {
    guard let (data, response) = try? await URLSession.shared.data(for: api.asURLRequest()) else {
      throw AppError.network(.notConnected)
    }
    
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
      throw AppError.network(.inValidStatusCode)
    }

    
    guard let dto = try? JSONDecoder().decode(type, from: data) else {
      throw AppError.network(.decodingFail)
    }
    
    return dto
  }
}

extension Encodable {
  func toData() -> Data {
    return try! JSONEncoder().encode(self)
  }
}

