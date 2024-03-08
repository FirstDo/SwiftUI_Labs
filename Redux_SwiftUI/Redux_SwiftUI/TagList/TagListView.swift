import SwiftUI

struct TagListView: View {
  let tags: [String]
  let lineSpacing: CGFloat
  let itemSpacing: CGFloat
  let width: CGFloat
  
  init(tags: [String], lineSpacing: CGFloat = 10, itemSpacing: CGFloat = 10, width: CGFloat) {
    self.tags = tags
    self.lineSpacing = lineSpacing
    self.itemSpacing = itemSpacing
    self.width = width
  }
  
  var body: some View {
    let realTags = makeTags()
    
    VStack(alignment: .leading, spacing: lineSpacing) {
      ForEach(realTags.indices, id: \.self) { row in
        HStack(spacing: itemSpacing) {
          ForEach(realTags[row].indices, id: \.self) { col in
            Text(realTags[row][col])
              .font(.system(size: 20))
              .padding(8)
              .background(Color.red)
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
  }
  
  private func makeTags() -> [[String]] {
    var datas: [[String]] = [[], []]
    
    var index = 0
    var currentWidth: CGFloat = 0

    for tag in tags {
      let fontSize = tag.size(withAttributes: [.font: UIFont.systemFont(ofSize: 20)]).width + itemSpacing + 16
      
      if currentWidth + fontSize >= width {
        index += 1
        currentWidth = 0
      }
      
      if index >= 2 { break }
      
      datas[index].append(tag)
      currentWidth += fontSize
    }
    
    return datas
  }
}

#Preview {
  TagListView(tags: ["short", "tag1", "loooooooong", "s", "normal","tag2", "한글태그", "english tag", "tag3", "tag4", "tag5", "last tag"], width: UIScreen.main.bounds.width)
}
