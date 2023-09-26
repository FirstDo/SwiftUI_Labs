import UIKit
import SwiftUI

final class MoreInformationView: UIView {
  
  let root = UIView()
  
  let headerLabel: UILabel = {
    $0.textColor = .label
    $0.text = "건강 앱에서 더 알아보기"
    $0.font = .boldSystemFont(ofSize: 24)
    return $0
  }(UILabel())
  
  let imgView: UIImageView = {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.tintColor = .orange
    $0.image = UIImage(systemName: "swift")
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())
  
  let titleLabel: UILabel = {
    $0.textColor = .label
    $0.text = "심방세동 기록"
    $0.font = .boldSystemFont(ofSize: 20)
    return $0
  }(UILabel())
  
  let descriptionLabel: UILabel = {
    $0.textColor = .label
    $0.text = "심방세동이 있는 경우 심장이 불규칙적으로 뛰는 빈도를 파악하는 데 Apple Watch가 도움이 될 수 있습니다"
    $0.numberOfLines = 0
    $0.font = .preferredFont(forTextStyle: .body)
    return $0
  }(UILabel())
  
  let btn: UIButton = {
    $0.setTitle("설정", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.backgroundColor = .tintColor
    $0.layer.cornerRadius = 10
    
    return $0
  }(UIButton())
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .clear
    
    addSubview(root)
    root.flex.define {
      $0.addItem(headerLabel).marginBottom(5)
      
      $0.addItem().backgroundColor(.white).padding(20).cornerRadius(15).define {
        $0.addItem().alignItems(.center).define {
          $0.addItem(imgView).width(100).aspectRatio(1).marginTop(40)
        }
        .marginBottom(10)
        
        $0.addItem().define {
          $0.addItem(titleLabel).marginBottom(10)
          $0.addItem(descriptionLabel).marginBottom(20)
          $0.addItem(btn).height(50)
        }
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

struct MoreInformationView_PreView: PreviewProvider {
  static var previews: some View {
    UIViewPreview {
      MoreInformationView()
    }
  }
}
