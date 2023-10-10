import SwiftUI

final class BaseHostingVC<Content>: UIHostingController<Content> where Content: View {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.isHidden = true
  }
}
