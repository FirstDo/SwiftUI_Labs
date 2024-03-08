import Foundation

enum TodoAPI {
  case todo(Int)
}

extension TodoAPI: TargetType {
  var baseURL: String {
    return "https://jsonplaceholder.typicode.com/todos/"
  }
  
  var path: String {
    switch self {
    case .todo(let id):
      return "\(id)"
    }
  }
  
  var method: HTTPMethod {
    return .get
  }
  
  var task: HTTPTask {
    return .plain
  }
  
  var headers: [String : String]? {
    return nil
  }
}

struct TodoEntity {
  let userId: Int
  let id: Int
  let title: String
  let completed: Bool
}

struct TodoResponseDTO: Responsable {
  let userId: Int
  let id: Int
  let title: String
  let completed: Bool
  
  static var mock: TodoResponseDTO {
    .init(userId: 1, id: 1, title: "delectus aut autem", completed: false)
  }
  
  var toDomain: TodoEntity {
    .init(
      userId: self.userId,
      id: self.id,
      title: self.title,
      completed: self.completed
    )
  }
}
