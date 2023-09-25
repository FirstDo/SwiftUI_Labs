import UIKit
import SwiftUI

import FlexLayout
import PinLayout

class ViewController: UIViewController {
  
  override func loadView() {
    super.loadView()
    
    self.view = MainView(frame: view.frame)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "심장"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}

fileprivate class MainView: UIView {
  
  lazy var tableview: UITableView = {
    $0.dataSource = self
    $0.delegate = self
    $0.separatorStyle = .none
    $0.register(DefaultCell.self, forCellReuseIdentifier: "DefaultCell")
    $0.register(HeartRateCell.self, forCellReuseIdentifier: "HeartRateCell")
    $0.register(TextHeaderView.self, forHeaderFooterViewReuseIdentifier: "TextHeaderView")
    
    return $0
  }(UITableView(frame: .zero, style: .insetGrouped))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    addSubview(tableview)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    tableview.pin.all()
  }
}

extension MainView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 3
    case 1:
      return 1
    case 2:
      return 1
    case 3:
      return 2
    case 4:
      return 1
    case 5:
      return 6
    default:
      fatalError()
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0...4:
      let cell = tableView.dequeueReusableCell(withIdentifier: "HeartRateCell", for: indexPath) as! HeartRateCell
      cell.configure(model: HeartRate.mock[indexPath.section].1[indexPath.row])
      return cell
    case 5:
      let data = ["말초 관류 지수", "불규칙한 박동 알림", "심방세동 기록", "심전도(ECG)", "저심박수 알림", "혈압"]
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! DefaultCell
      cell.configure(text: data[indexPath.row], showSeparator: indexPath.row != 5)
      return cell
    default:
      fatalError()
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if (0...4) ~= section {
      let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TextHeaderView") as! TextHeaderView
      header.configure(text: HeartRate.mock[section].section)
      return header
    }
    
    return nil
  }
  
  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    guard let header = view as? TextHeaderView, (0...4) ~= section else { return }
//    header.configure(text: HeartRate.mock[section].section)
  }
  
//  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//    return 100
//  }
}

struct MainPreview: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      UIViewPreview {
        MainView()
      }
      .navigationTitle("심장")
    }
  }
}
