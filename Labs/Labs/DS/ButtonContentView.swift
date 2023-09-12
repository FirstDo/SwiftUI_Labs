import SwiftUI

struct ButtonContentView: View {
  @State var fontSize: CGFloat = 14
  @State var foregroundColor: Color = .white
  @State var backgroundColor: Color = .green
  @State var cornerRadius: CGFloat = 10
  @State var isEnabled = true
  
  var body: some View {
    VStack {
      CSButton(
        action: {
        fontSize = 14
        foregroundColor = .white
        backgroundColor = .green
        cornerRadius = 10
        isEnabled = true
      },
        title: "Custom Button1",
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        font: .system(size: fontSize),
        cornerRadius: cornerRadius
      )
      .disabled(!isEnabled)
      
      CSButton(
        action: {
        fontSize = 14
        foregroundColor = .white
        backgroundColor = .green
        cornerRadius = 10
        isEnabled = true
      },
        title: "Custom Button2"
      )
      .foreground(foregroundColor)
      .background(backgroundColor)
      .font(.system(size: fontSize))
      .cornerRadius(cornerRadius)
      .disabled(!isEnabled)
      Slider(value: $fontSize,in: 10...50, step: 1)
        .tint(.orange)
      ColorPicker("FG Color", selection: $foregroundColor, supportsOpacity: true)
      ColorPicker("BG Color", selection: $backgroundColor, supportsOpacity: true)
      Slider(value: $cornerRadius, in: 0...40, step: 1)
        .tint(.red)
      Toggle("Button State", isOn: $isEnabled)
    }
    .padding()
  }
}

struct ButtonContentView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonContentView()
  }
}
