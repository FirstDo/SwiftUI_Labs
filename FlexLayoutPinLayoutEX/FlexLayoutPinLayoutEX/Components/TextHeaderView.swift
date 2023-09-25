import UIKit

class TextHeaderView: UITableViewHeaderFooterView {
  
  let container = UIView()
  let label: UILabel = {
    $0.font = .boldSystemFont(ofSize: 20)
    $0.textColor = .label
    return $0
  }(UILabel())
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    
    addSubview(container)
    container.flex.define {
      $0.addItem(label).marginLeft(20)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    container.pin.all()
    container.flex.layout(mode: .adjustHeight)
  }
  
  func configure(text: String) {
    self.label.text = text
    self.label.flex.markDirty()
  }
}
