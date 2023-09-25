import UIKit
import SwiftUI

import PinLayout
import FlexLayout

final class DefaultCell: UITableViewCell {
  
  let disclosureIndicator: UIImageView = {
    $0.image = UIImage(systemName: "chevron.right")
    $0.contentMode = .scaleAspectFit
    $0.tintColor = .gray
    return $0
  }(UIImageView())
  
  let label: UILabel = {
    $0.textColor = .label
    return $0
  }(UILabel())
  
  let separator: UIView = {
    $0.backgroundColor = .systemGray5
    $0.pin.height(1)
    return $0
  }(UIView())
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.flex.define {
      $0.addItem().justifyContent(.end).define {
        
        $0.addItem().direction(.row).margin(20).justifyContent(.spaceBetween).define {
          $0.addItem(label)
          $0.addItem(disclosureIndicator).size(15)
        }
        
        $0.addItem(separator).marginLeft(20)
      }
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.flex.layout(mode: .adjustHeight)
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)
    contentView.flex.layout(mode: .adjustHeight)
    return contentView.frame.size
  }
  
  func configure(text: String, showSeparator: Bool) {
    self.label.text = text
    self.label.flex.markDirty()
    self.separator.flex.isIncludedInLayout = showSeparator
  }
}
