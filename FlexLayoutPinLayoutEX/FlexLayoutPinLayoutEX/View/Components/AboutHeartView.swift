import UIKit
import SwiftUI

final class AboutHeartView: UIView {
  
  let root = UIView()
  
  let imgView: UIImageView = {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    return $0
  }(UIImageView())
  
  let titleLabel: UILabel = {
    $0.textColor = .label
    $0.font = .boldSystemFont(ofSize: 24)
    return $0
  }(UILabel())
  
  let descriptionLabel: UILabel = {
    $0.textColor = .label
    $0.font = .preferredFont(forTextStyle: .body)
    return $0
  }(UILabel())
  
  init(data: MoreData) {
    super.init(frame: .zero)
    
    self.layer.cornerRadius = 15
    self.clipsToBounds = true
    
    backgroundColor = .white
    imgView.image = UIImage(named: data.imageName)
    
    titleLabel.text = data.title
    descriptionLabel.text = data.description
    
    addSubview(root)
    root.flex.define {
      $0.addItem(imgView).height(200)
      $0.addItem().backgroundColor(.white).padding(20).define {
        $0.addItem(titleLabel)
        $0.addItem(descriptionLabel)
      }
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    
    root.pin.all()
    root.flex.layout(mode: .adjustHeight)
  }
}


struct AboutHeartView_Preview: PreviewProvider {
  static var previews: some View {
    ZStack {
      UIViewPreview {
        AboutHeartView(data: .mock.first!)
      }
      .previewLayout(.sizeThatFits)
    }
    .previewLayout(.sizeThatFits)
  }
}
