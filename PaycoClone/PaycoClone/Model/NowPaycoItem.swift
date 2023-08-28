enum NowPaycoItem: String, Identifiable, CaseIterable {
  case dudu = "dudu"
  case payco = "payco"
  case iphone = "iphone"
  case applePark = "applePark"
  case lsBuilding = "lsBuilding"
  
  var id: String {
    return rawValue
  }
  
  var icon: String {
    return rawValue
  }
}
