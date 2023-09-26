import UIKit

final class HeartRateCell: UITableViewCell {
  
  let disclosureIndicator: UIImageView = {
    $0.image = UIImage(systemName: "chevron.right")
    $0.contentMode = .scaleAspectFit
    $0.tintColor = .gray
    return $0
  }(UIImageView())
  
  let heartImage: UIImageView = {
    $0.image = UIImage(systemName: "heart.fill")
    $0.contentMode = .scaleAspectFit
    $0.tintColor = .red
    return $0
  }(UIImageView())
  
  let titleLabel: UILabel = {
    $0.textColor = .red
    $0.font = .boldSystemFont(ofSize: 15)
    return $0
  }(UILabel())
  
  let timeLabel: UILabel = {
    $0.textColor = .gray
    $0.font = .preferredFont(forTextStyle: .caption1)
    return $0
  }(UILabel())
  
  let mainValueLabel: UILabel = {
    $0.textColor = .label
    $0.font = .boldSystemFont(ofSize: 30)
    return $0
  }(UILabel())
  
  let unitLabel: UILabel = {
    $0.textColor = .gray
    $0.font = .boldSystemFont(ofSize: 15)
    return $0
  }(UILabel())
  
  let descriptionLabel: UILabel = {
    $0.textColor = .gray
    return $0
  }(UILabel())
  
  let topLabel: UILabel = {
    $0.textColor = .gray
    return $0
  }(UILabel())

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.flex.direction(.column).backgroundColor(.systemGray6).define {
      $0.addItem().marginVertical(5).padding(15).backgroundColor(.white).justifyContent(.spaceBetween).cornerRadius(12).define {
        
        $0.addItem().direction(.row).justifyContent(.spaceBetween).define {
          
          $0.addItem().direction(.row).alignItems(.center).define {
            $0.addItem(heartImage).aspectRatio(1).size(15).marginRight(5)
            $0.addItem(titleLabel)
          }
          
          $0.addItem().direction(.row).alignItems(.center).define {
            $0.addItem(timeLabel).marginRight(5)
            $0.addItem(disclosureIndicator).aspectRatio(1).size(15)
          }
        }
        
        $0.addItem().define {
          $0.addItem(topLabel)

          $0.addItem().direction(.row).alignItems(.baseline).define {
            $0.addItem(mainValueLabel).marginRight(5)
            $0.addItem(unitLabel)
          }

          $0.addItem(descriptionLabel)
        }
      }.height(130)
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
  
  func configure(model: HeartRate) {
    self.titleLabel.text = model.title
    self.timeLabel.text = model.time
    self.topLabel.text = model.heartRateTime
    self.mainValueLabel.text = model.value
    self.unitLabel.text = model.unit
    self.descriptionLabel.text = model.description
    
    contentView.flex.markDirty()
  }
}
