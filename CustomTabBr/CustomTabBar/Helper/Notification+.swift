import Foundation
import Combine

@propertyWrapper
struct NotificationName {
    
    enum Noti: String {
        case hideTap
        case showTap
    }
    
    let noti: Noti
    
    var wrappedValue: Notification.Name {
        get { return .init(noti.rawValue) }
    }
}

enum Noti {
    @NotificationName(noti: .hideTap) static var hideTap: Notification.Name
    @NotificationName(noti: .showTap) static var showTap: Notification.Name
}

struct NotiManager {
    static func post(_ notification: Notification) {
        NotificationCenter.default.post(notification)
    }

    static func post(name: Notification.Name, object: Any? = nil) {
        NotificationCenter.default.post(name: name, object: object)
    }
    
    static func publisher(for name: Notification.Name, object: AnyObject? = nil) -> NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: name, object: object)
    }
}
