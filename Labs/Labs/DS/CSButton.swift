import SwiftUI

extension CSButton {
  func foreground(_ color: Color) -> Self {
    var new = self
    new.foregroundColor = color
    return new
  }
  
  func background(_ color: Color) -> Self {
    var new = self
    new.backgroundColor = color
    return new
  }
  
  func font(_ font: Font) -> Self {
    var new = self
    new.font = font
    return new
  }
  
  func cornerRadius(_ value: CGFloat) -> Self {
    var new = self
    new.cornerRadius = value
    return new
  }
}

struct CSButton: View {
  @Environment(\.isEnabled) var isEnabled
  
  let action: () -> Void
  let title: String
  
  var foregroundColor: Color = .white
  var backgroundColor: Color = .green
  var font: Font = .body
  var cornerRadius: CGFloat = 10
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .foregroundColor(foregroundColor)
        .font(font)
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 64)
        .background(
          RoundedRectangle(cornerRadius: cornerRadius)
            .fill(backgroundColor)
        )
        .overlay {
          if isEnabled == false {
            Color.black.cornerRadius(cornerRadius).opacity(0.4)
          }
        }
    }
    
  }
}

struct CSButton_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      VStack {
        CSButton(action: {}, title: "취소")
          .background(.gray.opacity(0.7))
          .previewLayout(.sizeThatFits)
        
        CSButton(action: {}, title: "확인")
          .disabled(true)
          .previewLayout(.sizeThatFits)
        
        CSButton(action: {}, title: "확인")
          .previewLayout(.sizeThatFits)
      }
      .padding()
      .navigationTitle("Buttons")
      .navigationBarTitleDisplayMode(.large)
    }
  }
}
