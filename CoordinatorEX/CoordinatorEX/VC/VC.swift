import UIKit

class VC: UIViewController {
  
  var a: ACoordinator?
  var b: BCoordinator?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    a = ACoordi(navigationController: self.navigationController!)
    b = BCoordi(navigationController: self.navigationController!)
    
  }
  
  @IBAction func ATapped(_ sender: Any) {
    a?.pushToA()
  }
  
  @IBAction func BTapped(_ sender: Any) {
    b?.pushToB()
  }
}

